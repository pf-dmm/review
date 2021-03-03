class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      
      t.boolean "signin_ok", default: false, null: false
      t.boolean "signup_ok", default: false, null: false
      t.boolean "instance", default: false, null: false
      t.boolean "share_others", default: false, null: false
      t.string "title", null: false
      t.string "site_url"
      t.string "git_hub_url"
      t.string "files"
      t.text "background_story", null: false
      t.text "target", null: false
      t.text "ingenuity_point", null: false
      t.text "difficult_point", null: false
      t.text "learn_point", null: false
      t.text "wanna_install", null: false
      t.text "remarks"
      t.integer "user_id"
      t.string "image_id"
      
      t.timestamps
    end
  end
end
