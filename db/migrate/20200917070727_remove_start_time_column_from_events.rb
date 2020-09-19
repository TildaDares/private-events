class RemoveStartTimeColumnFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :start_time
  end
end
