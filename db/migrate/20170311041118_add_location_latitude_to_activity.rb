class AddLocationLatitudeToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :location_latitude, :float
  end
end
