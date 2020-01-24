class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string "author"
      t.string "content_body"
      t.integer "rating"
      t.integer "product_id"
    end
  end
end
