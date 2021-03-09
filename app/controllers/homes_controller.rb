class HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @portfolios = Portfolio.all
  end

  def about
  end
end
