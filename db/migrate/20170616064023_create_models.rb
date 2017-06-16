class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.references :car, foreign_key: true
      t.references :dealership, foreign_key: true
      t.integer :year
      t.decimal :price

      t.timestamps
    end
  end
end
