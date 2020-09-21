require 'rails_helper'

RSpec.describe 'As a merchant user' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Brians Bagels',
                                     address: '125 Main St',
                                     city: 'Denver',
                                     state: 'CO',
                                     zip: 80218)
    @merchant_user = @merchant1.users.create!(name: 'Megan',
                                     address: '123 Main St',
                                     city: 'Denver',
                                     state: 'CO',
                                     zip: 80218,
                                     email: 'megan_1@example.com',
                                     password: 'securepassword')

    @discount1 = BulkDiscount.create!(discount_percentage: 5,
                                      item_minimun: 6,
                                     merchant_id: @merchant1.id)
    @discount2 = BulkDiscount.create!(discount_percentage: 10,
                                     item_minimun: 12,
                                     merchant_id: @merchant1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant_user)
  end
  describe 'When I visit /merchant/bulk_discounts/new'
  it "I can fill out a form to create a new bulk discount" do
    expect(BulkDiscount.all.size).to eq(2)
    visit "/merchant/bulk_discounts/new"
    
    fill_in "Discount percentage", with: 15
    fill_in "Item minimun", with: 7

    click_on "New Bulk Discount"

    expect(current_path).to eq("/merchant/bulk_discounts")
    expect(BulkDiscount.all.size).to eq(3)
  end
end
