class CreateTableDealerDealerships < ActiveRecord::Migration[5.1]
  def change
    create_table :dealers_dealerships do |t|
      t.belongs_to :dealer, index: true
      t.belongs_to :dealership, index: true
    end
  end
end
