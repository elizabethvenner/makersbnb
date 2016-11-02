feature 'user signin' do
  let!(:user) do
    User.create(first_name: "Jenny",
                surname: "Smith",
                email: "jenny.smith@hotmail.com",
                password: "bau",
                password_confirmation: "bau")
    end

  scenario 'user can sign in' do
    signin(email: user.email, password: user.password)

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Welcome #{user.first_name}"
  end

  scenario 'user can\'t sign in with an incorrect email or password' do
    signin(email: "jenny.smith@hotmail.com", password: "bau123")
    expect(current_path).to eq('/sessions')
    expect(page).to have_content("The email or password is incorrect")

  end
end
