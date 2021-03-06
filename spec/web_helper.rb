def add_space(name: "Stylish apartment in London Bridge.",
              location: "London Bridge",
              description: "Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.",
              price: 120,
              available_from: "06/11/2016",
              available_to: "31/12/2016")
  visit '/space/add'
  fill_in :name, with: name
  fill_in :location, with: location
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :available_from, with: available_from
  fill_in :available_to, with: available_to
  click_button "Add space"
end

def add2_space(name: "Flat in Archway.",
              location: "Archway",
              description: "Spacious 2 bed apartment with kitchenette.",
              price: 100,
              available_from: "06/11/2016",
              available_to: "31/12/2016")
  visit '/space/add'
  fill_in :name, with: name
  fill_in :location, with: location
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :available_from, with: available_from
  fill_in :available_to, with: available_to
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

def user2_signup(first_name: "Lacey",
                surname: "Potter",
                email: "l.potter@aol.com",
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

def user3_signup(first_name: "Talluah",
                surname: "Jones",
                email: "t.j@aol.com",
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

def signin(email:, password:)
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :password, with: password
  click_button "Sign In"
end
