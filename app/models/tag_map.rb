class TagMap < ApplicationRecord
  belongs_to :portfolio
  belongs_to :tag
  
  validates :portfolio_id, presence: true
  validates :tag_id, presence: true
end
