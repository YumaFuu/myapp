class HomeController < ApplicationController
  def top
    @tasks = Task.all
  end

  def new
  end

  def create
    @task = Task.new(name: params[:name])
    @task.save
    redirect_to("/")

  end

  def show
    @task = Task.find_by(id: params[:id])

  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.name = params[:name]
    @task.description = params[:description]
    @task.save
    redirect_to("/")
  end


  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/")

  end

end
