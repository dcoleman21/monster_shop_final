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
  describe 'When I visit /merchant/bulk_discounts/:id'
  it "I can click a link to edit that bulk discount" do
    visit "/merchant/bulk_discounts/#{@discount1.id}"

    click_link 'Edit'
    expect(current_path).to eq("/merchant/bulk_discounts/#{@discount1.id}/edit")

    expect(page).to have_content("Edit Bulk Discount")
    expect(page).to have_field("Discount percentage")
    expect(page).to have_field("Item minimun")

    fill_in "Discount percentage", with: 20
    fill_in "Item minimun", with: 15

    expect(@discount1.discount_percentage).to eq(5)

    click_on "Edit Bulk Discount"
    
    @discount1.reload
    expect(@discount1.discount_percentage).to eq(20)

    expect(current_path).to eq('/merchant/bulk_discounts')

    within "#discount-#{@discount1.id}" do
      expect(page).to have_content(20)
      expect(page).to have_content(15)
    end
  end
end
