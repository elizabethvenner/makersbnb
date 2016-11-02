feature 'User signs out' do

  scenario 'while being signin' do
    user_signup
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome John')
  end
end
