class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :model
      t.float :price
      t.string :brand
      t.integer :number_of_km
      t.integer :car_capacity
      t.text :description
      t.integer :user_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
