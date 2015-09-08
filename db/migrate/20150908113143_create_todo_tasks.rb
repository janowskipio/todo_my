class CreateTodoTasks < ActiveRecord::Migration
  def change
    create_table :todo_tasks do |t|
      t.belongs_to :todo_lists, index:true
      t.string :content

      t.timestamps null: false
    end
  end
end
