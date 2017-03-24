require 'rails_helper'

# Story: As a unauthenticated user I can see the apartment listing and nothing else.
RSpec.feature "LandingPages", type: :feature do
  context "Landing page" do
    Steps "Going to Landing page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see The Apartment App, link to list an apartment, and link to show apartments" do
        expect(page).to have_content("The Apartment App");
        expect(page).to have_content("Create Apartment");
        expect(page).to have_content("Sign In")
        expect(page).to have_content("Sign Up")
      end
    end
  end
end
