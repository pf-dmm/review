class Admin::PortfoliosController < ApplicationController
    before_action :authenticate_admin!

    def index
      @portfolios = Portfolio.all
    end

    def show
      @portfolio =Portfolio.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
      portfolio = Portfolio.find(params[:id])
      if portfolio.delete
        redirect_to admin_portfolios_path
      else
        render :index
      end
    end

end
