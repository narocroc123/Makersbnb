feature 'User signs in' do
  scenario 'user signs in successfully' do
    User.create(name: "Test Name", email: "testemail@test.com" , password: "password")
    visit '/sessions/new'
    fill_in :email, with: 'testemail@test.com'
    fill_in :password, with: 'password'
    click_button 'Sign in'

    expect(page).to have_content "Welcome, Test Name. You are now registered."
  end
end
