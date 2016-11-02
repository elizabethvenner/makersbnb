feature 'User sign-up' do

  scenario 'new user can sign up' do
    expect{user_signup}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome John")
    expect(User.first.email).to eq("j.smith@aol.com")
  end

  scenario 'passwords do not match' do
    expect { user_signup(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Sorry, Passwords mismatch!!'
  end

  scenario 'a email must be given' do
    expect{user_signup(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Email is mandatory'
  end

  scenario 'email must be entered in the correct format' do
    expect{user_signup(email: 'thisisawrongemail')}.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'Please enter a correct email address'
  end

  scenario 'Cannot sign up with a email that is already in the system' do
    user_signup
    expect{user_signup(email: "j.smith@aol.com")}.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content 'This email is already in use'
  end

end
