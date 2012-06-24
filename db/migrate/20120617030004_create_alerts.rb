class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :venue

      t.timestamps
    end
  end
end
