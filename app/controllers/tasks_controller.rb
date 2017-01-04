class TasksController < ApplicationController
  
  # CreateAction
  def create
    # 新規登録する Task に紐付く Project を取得する
    @project = Project.find(params[:project_id])
    
    # パラメータを基に Task を作る
    @task = @project.tasks.create(task_params)
    
    # Project の詳細画面を表示する
    redirect_to project_path(@project.id)
  end
  
  private
    
    # 受け取るパラメータを private で定義しておく
    def task_params
      params[:task].permit(:title)
    end
  
end