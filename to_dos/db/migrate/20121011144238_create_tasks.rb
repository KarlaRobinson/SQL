class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.boolean :task_status, default: false
      t.integer :loc, default: :id
    end
  end
end
