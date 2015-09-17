class TodoList < ActiveRecord::Base

  has_many :todo_tasks, :dependent => :destroy

  validates :title, :presence => true,
                    :uniqueness => true,
                    :length => { :maximum => 100}
  validates_presence_of :description

end
