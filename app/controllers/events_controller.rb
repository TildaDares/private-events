class EventsController < ApplicationController
  before_action :login_required, only: [:new, :edit, :destroy]
  def index
    @events = Event.all
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      flash[:notice] = "Event succesfully created"
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = current_user.hosted_events.find(params[:id])
  end

  def update
    @event = current_user.hosted_events.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event succesfully updated"
      redirect_to event_path(@event)
    else
      render "new"
    end
  end

  def destroy
    @event = current_user.hosted_events.find(params[:id])
    @event.destroy
    flash[:notice] = "Event successfully destroyed"
    redirect_to user_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:location, :end_date, :description, :start_date, :title)
  end

end