feature 'book space' do
  scenario 'user request to book space' do
    user_signup
    add_space
    visit '/listings'
    expect(page).to have_content("Stylish")
    fill_in :check_in, with: "06/11/2016"
    click_button 'Request space'

    expect(page).to have_content("Thank you. Your request has been sent!")
  end
end
