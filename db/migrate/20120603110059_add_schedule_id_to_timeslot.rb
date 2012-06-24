class AddScheduleIdToTimeslot < ActiveRecord::Migration
  def change
    add_column :timeslots, :schedule_id, :integer
  end

end
