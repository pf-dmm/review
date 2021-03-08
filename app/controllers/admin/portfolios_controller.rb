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

end
