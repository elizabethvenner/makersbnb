feature 'navigation buttons' do
  scenario 'clicking logging button' do
    visit '/'
    click_button 'Log In'
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'clicking New User button' do
    visit '/'
    click_link 'New User'
    expect(current_path).to eq('/user/new')
  end
end
