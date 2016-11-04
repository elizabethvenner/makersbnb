feature 'myspaces page' do
  let!(:user) do
    User.create(first_name: "Jenny",
                surname: "Smith",
                email: "jenny.smith@hotmail.com",
                password: "bau",
                password_confirmation: "bau")
    end
  let (:space) do
    Space.create(name: "Shabby chic apartment in Shoreditch.",
                 location: "Shoreditch",
                 description: "Cosy 1 bed studio.",
                 price: 110,
                 user_id: user.id)
    end

  scenario 'User can see own spaces once they have been created' do
    user_signup
    click_link("My Spaces")

    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).to have_content "You  don't have any spaces!"
  end

  scenario 'User can only see only his/her own spaces' do
    user_signup
    add_space
    click_link("My Spaces")
    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).to have_content("Stylish apartment in London Bridge.")
    expect(page).not_to have_content "Shabby chic apartment in Shoreditch."
  end

  scenario 'User can delete a space' do
    user_signup
    add_space
    click_link("My Spaces")
    click_button("DELETE")
    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).not_to have_content("Stylish apartment in London Bridge.")
  end

  scenario 'User can edit a space' do
    user_signup
    add_space
    click_link('My Spaces')
    click_button('EDIT')
    fill_in :price, with: 150
    click_button('Submit')
    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).not_to have_content(120)
    expect(page).to have_content(150)
    expect(page).to have_content("Stylish apartment in London Bridge.")
  end
end
