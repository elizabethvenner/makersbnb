feature 'book space' do
  let (:user) do
    User.create(first_name: 'Jim', surname: 'Bloggs', email: 'jim@bloggs.com', password: 'password', password_confirmation: 'password')
  end

  let (:space) do
    Space.create(name: "Shabby chic apartment in Shoreditch",
                  location: "Shoreditch",
                  description: "Cosy 1 bed studio.",
                  price: 110,
                  user_id: user.id)
  end
  scenario 'user request to book space' do
    # add_space
    visit '/listings'
    expect(page).to have_content("Shabby")
    p user.valid?

    p space.valid?
    fill_in :check_in, with: "2016-11-06"
    fill_in :check_out, with: "2016-11-08"
    click_button 'Request space'

    expect(page).to have_content('You have requested this space from 6 Nov 2016 to 8 Nov 2016')
  end
end
