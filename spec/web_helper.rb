def add_space(name: "Stylish apartment in London Bridge.",
              location: "London Bridge",
              description: "Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.",
              price: 120)
  visit '/space/add'
  fill_in :name, with: name
  fill_in :location, with: location
  fill_in :description, with: description
  fill_in :price, with: price
  click_button "Add space"
end

def user_signup(first_name: "John",
                surname: "Smith",
                email: "j.smith@aol.com",
                password: "password",
                password_confirmation: "password")

  visit 'user/new'
  expect(page.status_code).to eq(200)

  fill_in :first_name, with: first_name
  fill_in :surname, with: surname
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "Sign Up"
end
