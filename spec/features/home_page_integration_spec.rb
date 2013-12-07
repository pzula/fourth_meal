require 'spec_helper'

describe "The home page experience" :type => :feature do

  it "brings up the correct type of restraunt when type is selected" do
    visit static_pages_home_path

     within("#food-types") do
      click_on "Bars"
    end

    expect(page).to have_text("Dive Bar")

    within("#food-types") do
      click_on "American"
    end
    
    expect(page).to have_text("Platable")
    expect(page).not_to have_text("Dive Bar")
  end


end

