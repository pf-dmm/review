class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :configure_post, only: [:show, :edit]
  protect_from_forgery :except => [:create]

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user_id = current_user.id
    tag_list = params[:portfolio][:tag_name].split(nil)
    if @portfolio.save
      @portfolio.save_tag(tag_list)
      redirect_to portfolio_path(@portfolio)
    else
      render "portfolios/new"
    end
  end

  def index
    @portfolios = Portfolio.all
    if @renge = params[:renge]
      if @renge == "ポートフォリオ名"
        @portfolios = Portfolio.search(params[:search])
      else
        @tags = Tag.search(params[:search])
      end
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @user = @portfolio.user
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(
    :image,
    :signin_ok,
    :signup_ok,
    :instance,
    :share_others,
    :title,
    :site_url,
    :git_hub_url,
    :files,
    :background_story,
    :target,
    :ingenuity_point,
    :difficult_point,
    :learn_point,
    :wanna_install,
    :remarks,
    :agreement
    )
  end
end
