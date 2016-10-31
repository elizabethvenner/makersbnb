def add_space(name: "Stylish appartment in London Bridge.",
              location: "London Bridge",
              description: "Spacious 2 bed apartment with ensuite bathroom and kitchenette with lovely views of the river.",
              price: "£120 per night")
  visit '/space/add'
  fill_in :name, with: name
  fill_in :location, with: location
  fill_in :description, with: description
  fill_in :price, with: price
  click_button "Add space"
end
