class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos, include: :tags
  end

  def show
    render json: Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo && @todo.update_attributes(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    render json: @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :id, :done, tag_names: [])
  end



end
