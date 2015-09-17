class TodoTask < ActiveRecord::Base

  belongs_to :todo_list

  validates :content, :presence => true,
                      :length => { :maximum => 50}

end
