feature 'myspaces page' do

  scenario 'be able to see my owned spaces' do
    user_signup
    click_button("My Spaces")

    expect(current_path).to eq "/sessions/user/spaces"
    expect(page).to have_content "You  don't have any spaces!"
  end
end
