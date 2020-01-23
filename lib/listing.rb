class Listings
  attr_reader :property_name, :description, :available_date, :price, :available

  def initialize(property_name:, description:, available_date:, price:, available:)
    @property_name = property_name
    @description = description
    @available_date = available_date
    @price = price
    @available = available
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property;")
    result.map { |row| Listings.new(property_name: row['property_name'], description: row['description'], available_date: row['available_date'], price: row['price'], available: row['available']) }
  end

  def self.create(property_name:, description:, available_date:, price:, available:)
    DatabaseConnection.query("INSERT INTO property (property_name, description, available_date, price, available) VALUES ('#{property_name}', '#{description}', '#{available_date}', '#{price}', 'TRUE');")
  end
end
