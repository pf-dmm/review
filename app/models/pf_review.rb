class PfReview < ApplicationRecord

  belongs_to :portfolio

  with_options presence: true do
    validates :reviewer_user_id
    validates :reviewed_user_id
    validates :portfolio_id
    validates :good_point
    validates :bad_point
    validates :learn_from
  end
end
