class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos= current_user.todos
  end

   def complete

    @todo=Todo.find(params[:id])
      if @todo.completed == true
          @todo.completed=false
          @todo.save
          redirect_to task_todos_path(:task_id)
      else
        @todo.completed=true
        @todo.save
        redirect_to task_todos_path(:task_id)
      end

  end
end
