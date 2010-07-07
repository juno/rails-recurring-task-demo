class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :state, :null => false
      t.string :action, :null => false
      t.text :options, :null => false
      t.text :schedule, :null => false
      t.datetime :next_occurence

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
