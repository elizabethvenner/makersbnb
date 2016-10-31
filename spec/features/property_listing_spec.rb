require 'spec_helper'

RSpec.feature 'see property listing' do
  scenario 'see listing on home page' do
    visit "/"
    expect(page).to have_content("Welcome to MakersBnb!")
    expect(page).to have_content("Stylish appartment in London Bridge.")

  end

end
