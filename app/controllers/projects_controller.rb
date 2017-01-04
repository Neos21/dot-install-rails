class ProjectsController < ApplicationController
  
  # before_action : 全てのアクションの手前に行われる共通関数を定義する
  # 「only:」で対象のアクションを限定できる。
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  # after_action もアルヨ
  
  # IndexAction を作る
  def index
    # @projects は View で使用する変数
    # Project.all で全件取得
    @projects = Project.all
  end
  
  # ShowAction
  def show
  end
  
  # NewAction
  def new
    @project = Project.new
  end
  
  # CreateAction
  def create
    # Form から情報を取得する。project_params はプライベート関数
    @project = Project.new(project_params)
    # DB に保存する : save の際に Models の Validation が行われる。save が成功したらトップにリダイレクトする
    if @project.save
      # redirect_to に Path を付けることでリダイレクトする
      redirect_to projects_path
    else
      # Validation により保存に失敗したら新規登録画面を再度開く
      render 'new'
    end
  end
  
  # EditAction
  def edit
  end
  
  # UpdateAction
  def update
    if @project.update(project_params)
      # 更新ができたら一覧に戻る
      redirect_to projects_path
    else
      # 更新に失敗した時は編集画面を再度開く
      render 'edit'
    end
  end
  
  # DestroyAction
  def destroy
    @project.destroy
    # 一覧に戻る
    redirect_to projects_path
  end
  
  # プライベート宣言
  private
    # Create 用のパラメータを扱うプライベート関数
    def project_params
      # params 中の project の中にある title の受取を許可する
      params[:project].permit(:title)
    end
    
    # before_action で定義した共通関数
    def set_project
      # :show, :edit, :update:, :destroy で共通していた前処理を集約する
      
      # URL で渡された値は params[シンボル] で取得可能
      # シンボル :id は rake routes で確認できる URI Pattern にて定義されている
      @project = Project.find(params[:id])
    end
  
end