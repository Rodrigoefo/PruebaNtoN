class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :todos
  has_many :tasks, through: :todos

  after_create :create_list

  def create_list
    Task.all.each do |task|
      @todos=Todo.create(user_id: self.id, task_id: task.id)
      @todos.save

    end
  end
end
