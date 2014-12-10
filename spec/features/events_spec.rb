require 'rails_helper'

feature "Events" do

  scenario "Delete an event" do
    Event.create!(
      description: "I'm going to be deleted"
    )

    visit root_path

    click_on "delete"

    expect(page).to have_no_content("I'm going to be deleted")
    expect(page.current_path).to eq(events_path)

  end

    scenario "User edits an event" do
      Event.create!(
        description: "My Christmass party"
      )

      visit root_path
      expect(page).to have_content("My Christmass party")
      click_on "edit"
      fill_in "Description", with: "My Christmas party"
      click_on "Update Event"

      expect(page).to have_content("My Christmas party")
      expect(page).to have_no_content("My Christmass party")
    end

  #example in class

  scenario 'listening events' do
    Event.create!(
      description: "free lunch today",
    )

    Event.create!(
      description: "Ramen festival",
    )

    Event.create!(
      description: "Hug Momo Hour"
    )

    visit root_path

    expect(page).to have_content("free lunch today")
    expect(page).to have_content("Hug Momo Hour")
    expect(page).to have_content("Ramen festival")
  end

#feature is your big organizing category, your CRUD
#scenario is  testing one way the feature behaves.
# you have a resource and want to test the actions for it

end
