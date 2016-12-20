class ProjectsController < ApplicationController
  
  # IndexAction を作る
  def index
    # @projects は View で使用する変数
    # Project.all で全件取得
    @projects = Project.all
  end
  
end
