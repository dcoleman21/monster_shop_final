class AddBulkDiscountToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :bulk_discount, :integer
  end
end
