require 'user'

describe User do
  it 'can create a new User' do
    user = User.create(name: "Test Name", email: "testemail@test.com" , password: "password")
    expect(user.id).to eq 1
    expect(user.name).to eq "Test Name"
    expect(user.email).to eq "testemail@test.com"
  end

  it 'can find a user by id' do
    user = User.create(name: "Test Name", email: "testemail@test.com" , password: "password")
    found_user = User.find(1)
    expect(found_user.id).to eq user.id
    expect(found_user.name).to eq user.name
    expect(found_user.email).to eq user.email
  end

  it 'can authenticate a user when signing in' do
    user = User.create(name: "Test Name", email: "testemail@test.com" , password: "password")
    authenticated_user = User.authenticate(email: "testemail@test.com" , password: "password")
    expect(authenticated_user.id).to eq user.id
  end

end
