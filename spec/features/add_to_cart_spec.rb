require 'rails_helper'

RSpec.feature "Visitor adds 1 product to their cart by clicking on the Add button", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the number of items in cart increase by 1" do
    # ACT
    visit root_path
    puts page.html
    click_button("Add", match: :first).click
    sleep 3

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end
