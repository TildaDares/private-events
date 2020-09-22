class AddColumnToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_reference :attendances, :user, foreign_key: true
    add_reference :attendances, :event, foreign_key: true
    #Ex:- add_index("admin_users", "username")
  end
end
