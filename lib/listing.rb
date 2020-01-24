class Listings
  attr_reader :id, :user_id, :property_name, :description, :available_date, :price, :available

  def initialize(id:, user_id:, property_name:, description:, available_date:, price:, available:)
    @id = id
    @user_id = user_id
    @property_name = property_name
    @description = description
    @available_date = available_date
    @price = price
    @available = available
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property;")
    result.map { |row| Listings.new(id: row['id'], user_id: row['user_id'], property_name: row['property_name'], description: row['description'], available_date: row['available_date'], price: row['price'], available: row['available']) }
  end

  def self.create(user_id:, property_name:, description:, available_date:, price:, available:)
    DatabaseConnection.query("INSERT INTO property (user_id, property_name, description, available_date, price, available) VALUES ('#{user_id}', '#{property_name}', '#{description}', '#{available_date}', '#{price}', 'TRUE');")
  end

  def self.select(id:)
    result = DatabaseConnection.query("SELECT * FROM property WHERE id=#{id};")
    Listings.new(id: result[0]['id'], user_id: result[0]['user_id'], property_name: result[0]['property_name'], description: result[0]['description'], available_date: result[0]['available_date'], price: result[0]['price'], available: result[0]['available'])
  end
end
