require 'rails_helper'

#Imagine Capybara is a human who has never used a computer before and you have to tell them EXPLICITLY everything you want to do

#Also these tests DO NOT talk to the _development database, they talk to the _test database, which is completely cleared after each test

RSpec.feature "TextacularSearches", type: :feature do
  context "Creating different search queries with Textacular" do
    Steps "We can search an apartment by address" do
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
      When "we can add an image when we create the apartment and go back to listing page" do
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
        click_link "Back"
      end
      Then "We can search for it" do
        fill_in "search", with: "Street" #fill in the field named "search" with "Lane"
        click_button "Search" #click the button, which calls the 'index' method in our ApartmentsController
        expect(page).to have_content("Street") #expect the page to display the apartment we just made, since we just searched for it
      end
    end
  end
  context "Creating a search by description with Textacular" do
    Steps "We can search an apartment by name" do
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
      When "we can add an image when we create the apartment and go back to listing page" do
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
        click_link "Back"
      end
      Then "We can search for it" do
        fill_in "search", with: "Test"
        click_button "Search"
        expect(page).to have_content("Test")
      end
    end
  end
end
