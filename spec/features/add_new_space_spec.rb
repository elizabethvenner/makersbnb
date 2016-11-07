feature 'add space' do

  scenario 'user adds a new space to the listings' do
    user_signup
    add_space

    expect(page).to have_content("Stylish apartment in London Bridge.")
    expect(page).to have_content("Location: London Bridge")
    expect(page).to have_content("Description: Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.")
    expect(page).to have_content("Price: £120 per night")
    expect(page).to have_content("Available from: Sunday 06 Nov 2016")
    expect(page).to have_content("Available to: Saturday 31 Dec 2016")

  end
end
