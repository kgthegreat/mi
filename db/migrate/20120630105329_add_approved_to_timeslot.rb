class AddApprovedToTimeslot < ActiveRecord::Migration
  def change
    add_column :timeslots, :approved, :boolean
  end
end
