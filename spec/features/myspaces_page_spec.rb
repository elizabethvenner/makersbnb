feature 'myspaces page' do

  scenario 'User can see own spaces once they have been created' do
    user_signup
    click_button("My Spaces")

    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).to have_content "You  don't have any spaces!"
  end

  scenario 'User can only see only his/her own spaces' do
    user_signup
    click_button("My Spaces")
    add_space
    user2_signup
    add2_space

  end
end
