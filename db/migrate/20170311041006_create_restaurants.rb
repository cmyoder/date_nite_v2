class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :location
      t.string :name
      t.integer :contributor_id

      t.timestamps

    end
  end
end
