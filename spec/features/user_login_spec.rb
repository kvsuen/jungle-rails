require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js:true do
  
  before :each do
    @user = User.create! first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test'
  end

  scenario "A user can login" do
    # ACT
    visit root_path
    
    click_on "Login"

    fill_in "email", with: "test@test.com"
    fill_in "password", with: "test"

    click_on "Submit"
    # DEBUG / VERIFY

    expect(page).to have_content "Signed in as test"

    save_screenshot
  end

end
