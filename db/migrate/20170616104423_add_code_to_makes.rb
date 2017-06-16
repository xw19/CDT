class AddCodeToMakes < ActiveRecord::Migration[5.1]
  def change
    add_column :makes, :code, :string
  end
end
