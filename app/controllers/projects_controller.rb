class ProjectsController < ApplicationController
  
  # IndexAction を作る
  def index
    # @projects は View で使用する変数
    # Project.all で全件取得
    @projects = Project.all
  end
  
  # ShowAction
  def show
    # URL で渡された値は params[シンボル] で取得可能
    # シンボル :id は rake routes で確認できる URI Pattern にて定義されている
    @project = Project.find(params[:id])
  end
  
end