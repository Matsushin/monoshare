class CreateRentals < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
