class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index
    @all = Todo.all
    @done = @all.select { |t| t.is_done }
    @todo = @all.select { |t| !t.is_done }

    if @all.length > 0
      @progressbar_width = (@done.length * 100) / @all.length
    end
  end

  def update_status
    todo = Todo.find(params[:id])
    todo.is_done = params[:isDone] == 'true'

    if todo.save
      render json: true
      else
        render :json => '', :status => 500
    end 
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    
    if @todo.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    if @todo.update(todo_params)
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      redirect_to todos_url, notice: 'Todo was successfully destroyed.'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end
end
