class AddOverViewToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :over_view, :text
  end
end
