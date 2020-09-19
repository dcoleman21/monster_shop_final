class CreateBulkDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :bulk_discounts do |t|
      t.integer :discount_percentage
      t.integer :item_minimun
    end
  end
end
