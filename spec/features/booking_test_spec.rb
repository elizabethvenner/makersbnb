feature 'book space' do
  scenario 'user request to book space' do
    user_signup
    add_space
    visit '/listings'
    fill_in :check_in, with: "06/11/2016"
    fill_in :check_out, with: "09/11/2016"
    click_button 'Request space'

    expect(page).to have_content("Thank you. Your request has been sent!")
  end

  scenario 'user request to booked space that is already taken' do
    user_signup
    add_space
    visit '/listings'
    fill_in :check_in, with: "06/11/2016"
    fill_in :check_out, with: "09/11/2016"
    click_button 'Request space'
    visit '/sessions/user/spaces/requests'
    click_button 'Confirm'
    click_button 'Log Out'

    user2_signup
    fill_in :check_in, with: "10/11/2016"
    fill_in :check_out, with: "15/11/2016"
    click_button 'Request space'
    click_button 'Log Out'

    user3_signup
    fill_in :check_in, with: "05/11/2016"
    fill_in :check_out, with: "07/11/2016"
    click_button 'Request space'

    expect(page).to have_content("Sorry the space is already booked for those days")
    expect(Booking.all.length).to eq 2




  end
end
