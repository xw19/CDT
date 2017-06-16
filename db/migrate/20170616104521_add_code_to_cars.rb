class AddCodeToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :code, :string
  end
end
