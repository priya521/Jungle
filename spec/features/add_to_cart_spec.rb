require 'rails_helper'

RSpec.feature "Add to Cart", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'
    @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      @user = User.create!(
        name: 'Kapil Garg',
        email: 'iamkapilgarg@gmail.com',
        password: 'abcd',
        password_confirmation: 'abcd'
      )
  end

  scenario "They see product details" do
    visit root_path
    click_button('Add')
    fill_in 'email', with: 'iamkapilgarg@gmail.com'
    fill_in 'password', with: 'abcd'
    find('input[name="commit"]').click
    go_forward
    click_button('Add')
    save_screenshot
    expect(page).to have_text 'My Cart (1)'
  end
end
