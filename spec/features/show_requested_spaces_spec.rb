feature 'show requested spaces' do
  scenario 'when another user requests my space' do
    user_signup
    add_space
    click_button 'Sign Out'
    user2_signup
    fill_in :check_in, with: "06/11/2016"
    click_button 'Request space'
    click_button 'Sign Out'
    signin('j.smith@aol.com', 'password')
    visit '/sessions/user/spaces/requests'
    find_button('Confirm').click
    expect(page).to have_content('Thank you for confirming this booking')
  end
end
