class User < ActiveRecord::Base

  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items
 has_secure_password
  validates :username, presence: true
  
  def get_completed_count
   todo_items.where(completed: true).count
  end

   
   def get_todo_lists
    self.todo_lists
	end
   
   def get_todo_items
	self.todo_items
   end
  
end
