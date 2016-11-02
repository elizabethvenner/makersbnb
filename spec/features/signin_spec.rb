feature 'user signin' do
  let!(:user) do
    User.create(first_name: "Jenny",
                surname: "Smith",
                email: "jenny.smith@hotmail.com",
                password: "bau",
                password_confirmation: "bau")
    end

  scenario 'user can sign in' do
    p user.email
    p user.password
    signin(email: user.email, password: user.password)

    expect(page.status_code).to eq(200)
    expect(page).to have_content "Welcome #{user.first_name}"
  end
end
