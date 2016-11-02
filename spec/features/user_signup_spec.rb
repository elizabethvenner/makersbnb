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

end
