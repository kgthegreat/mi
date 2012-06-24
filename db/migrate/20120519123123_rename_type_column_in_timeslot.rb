class RenameTypeColumnInTimeslot < ActiveRecord::Migration
  def change
    rename_column :timeslots, :type, :interview_type
  end

end
