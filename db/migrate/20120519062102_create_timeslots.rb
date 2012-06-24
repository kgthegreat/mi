class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :trainer
      t.string :type

      t.timestamps
    end
    add_index :timeslots, :trainer_id
  end
end
