class PfReviewsController < ApplicationController
  def new
    @portfolio = Portfolio.find(params[:portfolio_id])
    @pf_review = PfReview.new
  end

  def create
    @pf_review = PfReview.new(pf_review_params)
    @pf_review.reviewer_user_id = current_user.id
    @pf_review.reviewed_user_id = Portfolio.find(params[:pf_review][:portfolio_id]).user_id
    @pf_review.portfolio_id = Portfolio.find(params[:pf_review][:portfolio_id]).id
    r1 = PfReview.find_by(reviewed_user_id: current_user.id, reviewed_user_id: @pf_review.reviewed_user_id)
    r2 = PfReview.find_by(reviewed_user_id: @pf_review.reviewed_user_id, reviewed_user_id: current_user.id)
      if r1 && r2
        r1.update(review_each_other: true)
        r2.update(review_each_other: true)
      end
    if @pf_review.save
      redirect_to user_path(current_user)
    else
      @portfolio = Portfolio.find(params[:pf_review][:portfolio_id])
      render "pf_reviews/new"
    end

  end

  def show
  end

  def index
  end

  def edit
  end

  private
  def pf_review_params
    params.require(:pf_review).permit(:good_point, :bad_point, :learn_from, :others, :portfolio_id)
  end
end
