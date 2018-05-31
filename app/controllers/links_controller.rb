class LinksController < ApplicationController

  before_action :find_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link 成功"
      redirect_to links_path
    else
      flash[:alert] = "Link 不成功"
      redirect_to "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @link.update(link_params)
      flash[:notice] = "Link 修改成功"
      redirect_to links_path
    else
      flash[:alert] = "Link 修改不成功"
      render "edit"
    end
  end

  def destroy
    @link.destroy
    flash[:alert] = "Link 被刪除了"
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

  def find_link
    @link = Link.find(params[:id])
  end

end