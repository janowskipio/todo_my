class CreateTodoTasks < ActiveRecord::Migration
  def change
    create_table :todo_tasks do |t|
      t.belongs_to :todo_list
      t.string :content

      t.timestamps null: false
    end
    add_index :todo_tasks, :todo_list_id
  end
end
