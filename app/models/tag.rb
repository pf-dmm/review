class Tag < ApplicationRecord

  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :portfolios, through: :tag_maps

  def self.search(search)
    if search
      Tag.where("tag_name LIKE?", "%#{search}%")
    else
    end
  end
end