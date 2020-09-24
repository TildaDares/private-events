class AttendancesController < ApplicationController
  before_action :login_required
  def create
    event = Event.find(params[:event_id])
    user = User.find(params[:user_id])
    event.attendees << user
    if event.save
      redirect_to event_path(event)
    else
      flash[:alert] = "Unable to send invite"
      redirect_to event_path(event)
    end
  end

  def destroy
    event = Event.find(params[:event_id])
    user = User.find(params[:user_id])
    event.attendees.delete(user)
    redirect_to event_path(event)
  end
end
