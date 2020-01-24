class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string "name"
      t.decimal "cost"
      t.string "country_of_origin"

      t.timestamps()
    end
  end
end
