class RemoveColumnFromAttendance < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :attendee_id
    remove_column :attendances, :attended_event_id
  end
end
