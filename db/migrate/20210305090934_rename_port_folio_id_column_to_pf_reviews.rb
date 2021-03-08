class RenamePortFolioIdColumnToPfReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :pf_reviews, :port_folio_id, :portfolio_id
  end
end
