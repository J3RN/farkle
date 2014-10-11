require 'rails_helper'

feature "Static Pages" do
  scenario "user visits the landing page" do
    visit '/'

    # Various titles/text that the page should have
    expect(page).to have_text "Welcome"
    expect(page).to have_text "Farkle"

    # Should *certainly* have a link to new game
    expect(page).to have_button "New Game"
  end
end
