class DefaultApprovedToFalseInTimeslot < ActiveRecord::Migration
  def up
    change_column :timeslots, :approved, :boolean, :default => 0
  end

  def down
    change_column :timeslots, :approved, :boolean
  end
end
