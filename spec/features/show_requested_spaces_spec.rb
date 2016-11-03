feature 'show requested spaces' do

 let!(:user1) do
   User.create(first_name: "Jim",
               surname: "Boy",
               email: "jim@boy.com",
               password: "12345",
               password_confirmation: "12345")

 end


 scenario 'when another user requests my space' do
   signin(email: user1.email, password: user1.password)
   add_space
   click_button 'Sign Out'
   user2_signup
   fill_in :check_in, with: "06/11/2016"
   click_button 'Request space'
   click_button 'Sign Out'
   signin(email: user1.email, password: user1.password)
   visit '/sessions/user/spaces/requests'
   find_button('Confirm').click
   expect(page).to have_content('Thank you for confirming this booking')
   visit '/listings'
   expect(page).to have_content('Space available: false')
 end

end