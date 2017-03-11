class AddLocationLongitudeToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :location_longitude, :float
  end
end
