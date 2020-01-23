require 'bcrypt'

class User

  attr_reader :id, :email, :name

  def initialize(id:, email:, name:)
    @id = id.to_i
    @email = email
    @name = name
  end

  def self.create(name:, email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES ('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, email, name;")
    User.new(id: result[0]['id'], email: email, name: name)
  end

  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}';")
    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email='#{email}';")
    return unless result.any?

    User.new(id: result[0]['id'], email: result[0]['email'], name: result[0]['name'])
  end

end
