class CreateDealerShips < ActiveRecord::Migration[5.1]
  def change
    create_table :dealerships do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :logo
      t.string :short_name
      t.string :phone
      t.string :email
      t.integer :admin_id, index: { unique: true }

      t.timestamps
    end
  end
end
