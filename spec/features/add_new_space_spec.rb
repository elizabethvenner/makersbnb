feature 'add space' do

  scenario 'user adds a new space to the listings' do
    user_signup
    add_space

    within 'ul#spaces' do
      expect(page).to have_content("Stylish apartment in London Bridge.")
      expect(page).to have_content("Location: London Bridge")
      expect(page).to have_content("Description: Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.")
      expect(page).to have_content("Price: £120 per night")
      expect(page).to have_content("Email: example@aol.com")
      expect(page).to have_content("Space available: 1 November 2016")
    end
  end
end
