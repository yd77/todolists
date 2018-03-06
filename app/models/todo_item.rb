class TodoItem < ActiveRecord::Base
belongs_to :todo_list
default_scope{order :due_date}
#scope :ordered_by_date, -> {order due_date: :asc}
end
