class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.integer :contributor_id

      t.timestamps

    end
  end
end
