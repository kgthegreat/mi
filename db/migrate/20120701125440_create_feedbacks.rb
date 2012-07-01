class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.text :description
      t.references :schedule

      t.timestamps
    end
    add_index :feedbacks, :schedule_id
  end
end
