class AddNameToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :name, :string, :null => false
  end

  def self.down
    remove_column :tasks, :name
  end
end
