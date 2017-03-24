require 'rails_helper'

RSpec.feature "AddingImageToListings", type: :feature do
  context "We want to have an image with our apartment" do
    Steps "See above" do
      Given "We click the create apartment link and sign up" do
        visit '/'
        click_link('Create Apartment')
        click_link('head_sign_up')
        fill_in "Username", with: "test"
        fill_in "Email", with: "test@test.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button 'Sign up'
      end
      When "we can add an image when we create the apartment" do
        fill_in "Name", with: "Test Apartment"
        fill_in "Description", with: "This the test apartment."
        fill_in "Phone number", with: "123-456-7890"
        fill_in "Hours to contact", with: "9:00am - 5:00pm"
        fill_in "Address", with: "704 J Street"
        fill_in "Unit#", with: "1000"
        fill_in "City", with: "San Diego"
        fill_in "Postalcode", with: "92101"
        fill_in "State", with: "CA"
        fill_in "Country", with: "USA"
        # click_button "Choose File"
        attach_file('apartment[image]', '/Users/learn/Desktop/apartment_app/ApartmentApp/app/assets/images/apt_image_1.jpg')
        click_button "Create Apartment"
      end
      Then "our image is displayed" do
        page.find('img')['src'].should have_content("apt_image_1.jpg")
      end
    end
  end
end
