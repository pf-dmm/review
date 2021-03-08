class HomesController < ApplicationController

  def top
    @portfolios = Portfolio.all
  end

  def about
  end
end
