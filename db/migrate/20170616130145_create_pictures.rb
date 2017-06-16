class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.json :image
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end
  end
end
