feature 'users can sign up to SSBnB' do
  scenario 'user is registering' do
    visit '/'
    fill_in :name, with: "Test Name"
    fill_in :email, with: "testemail@makers.com"
    fill_in :password, with: "password"
    click_button 'Sign up'

    expect(page).to have_content "Welcome, Test Name. You are now registered."
  end
end
