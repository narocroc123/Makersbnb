feature 'User signs in' do
  scenario 'user signs in successfully' do
    User.create(name: "Test Name", email: "testemail@test.com" , password: "password")
    visit '/sessions/new'
    fill_in :email, with: 'testemail@test.com'
    fill_in :password, with: 'password'
    click_button 'Sign in'

    expect(page).to have_content "Welcome, Test Name. You are now registered."
  end

  scenario 'user sees an error if the email is wrong' do
    User.create(name: "Test Name", email: "testemail@test.com" , password: "password")

    visit '/sessions/new'
    fill_in :email, with: 'wrongtestemail@test.com'
    fill_in :password, with: 'password'
    click_button 'Sign in'

    expect(page).not_to have_content "Welcome, Test Name. You are now registered."
    expect(page).to have_content "Please check your email or password."
  end

end
