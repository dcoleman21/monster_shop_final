class Merchant::BulkDiscountsController < Merchant::BaseController

  def index
    @discounts = current_user.merchant.bulk_discounts
  end

  def new
    @discount = BulkDiscount.new
  end

  def create
    current_user.merchant.bulk_discounts.create(bulk_discount_params)
    redirect_to '/merchant/bulk_discounts'
  end

  def show
    @discount = BulkDiscount.find(params[:id])
  end

  def edit
    @discount = current_user.merchant.bulk_discounts.find(params[:id])
  end

  def update
    discount = BulkDiscount.find(params[:id])
    discount.update(bulk_discount_params)
    redirect_to "/merchant/bulk_discounts"
  end

  def destroy
    current_user.merchant.bulk_discounts.destroy(params[:id])
    redirect_to '/merchant/bulk_discounts'
  end

  private

  def bulk_discount_params
    params.permit(:discount_percentage, :item_minimun)
  end

  # def discount_params
  #   params.require(:bulk_discount).permit(:discount_percentage, :item_minimun)
  # end
end
