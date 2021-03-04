class PortfoliosController < ApplicationController
  def new
    @portfolio = Portfolio.new
  end

  def create
    portfolio = Portfolio.new(portfolio_params)
    portfolio.user_id = current_user.id
    if portfolio.save
      redirect_to portfolio_path(portfolio)
    else
      render "portfolios/new"
    end
  end

  def index
  end

  def show
    @portfolio = PortFolio.find(params[:id])
  end

  def edit
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
