class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal
    quantity * price
  end

  def fulfill
    update(fulfilled: true)
    item.update(inventory: item.inventory - quantity)
  end

  def fulfillable?
    item.inventory >= quantity
  end

  def bulk_discount
    BulkDiscount.where(id: self[:bulk_discount])[0]
  end

  def apply_discount(discount)
    percentage = (discount[:discount_percentage].to_f / 100)
    reduction = (price * percentage).round(2)
    update(price: price - reduction, bulk_discount: discount.id)
  end
end
# bulk discount is the discount id else nil
