class DomainsTrainers < ActiveRecord::Migration
  def up
    create_table :domains_trainers, :id => false do |t|
      t.references :domain, :null => false
      t.references :trainer, :null => false
    end
  end

  def down
    drop_table :domains_trainers
  end
end
