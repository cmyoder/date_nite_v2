class AddLocationFormattedAddressToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :location_formatted_address, :string
  end
end
