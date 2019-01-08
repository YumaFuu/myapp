class HomeController < ApplicationController

  def top
    if @status
      @tasks = Task.where status:@status.order(created_at: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
  end


  def new
  end

  def create
    @task = Task.new(name: params[:name],description: params[:description],deadline: params[:deadline],status: params[:status],priority: params[:priority])
    @task.save
    redirect_to("/")
    flash[:notice] = "タスクを登録しました"

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
    @task.deadline = params[:deadline]
    @task.status = params[:status]
    @task.priority = params[:priority]
    if @task.save
      redirect_to("/")
      flash[:notice] = "タスクを編集しました"
    else
      render("home/edit")
    end
  end


  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to("/")
    flash[:notice] = "削除しました"

  end

  def search_name
    @tasks = Task.where("name LIKE ?", "%#{params[:name]}%")
    render("home/top")
  end

  def search_status
    if params[:status] && params[:status] != "all"
      @tasks = Task.where(status: params[:status])
      render("home/top")
    else
      redirect_to("/")
    end

  end


  def search_priority
    if params[:priority] && params[:priority] != "all"
      @tasks = Task.where(priority: params[:priority])
      render("home/top")
    else
      redirect_to("/")
    end

  end




end
