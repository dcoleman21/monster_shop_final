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
  describe 'When I visit /merchant/bulk_discounts'
  it "I click on a discount and taken to that discounts show page" do
    visit '/merchant/bulk_discounts'

    within "#discount-#{@discount2.id}" do
      click_link "10% discount on 12 items or more"
    end

    expect(current_path).to eq("/merchant/bulk_discounts/#{@discount2.id}")
    expect(page).to have_content("Discount Percentage: #{@discount2.discount_percentage}")
    expect(page).to have_content("Item Minimum: #{@discount2.item_minimun}")
  end
end
