class AddReviewEachOtherToPfReview < ActiveRecord::Migration[5.2]
  def change
    add_column :pf_reviews, :review_each_other, :boolean, default: false, null: false
  end
end
