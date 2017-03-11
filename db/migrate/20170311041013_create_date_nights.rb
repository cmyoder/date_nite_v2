class CreateDateNights < ActiveRecord::Migration
  def change
    create_table :date_nights do |t|
      t.integer :user_id
      t.integer :date_id
      t.integer :restaurant_id
      t.integer :activity_id
      t.datetime :day

      t.timestamps

    end
  end
end
