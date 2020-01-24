class Listings
  attr_reader :id, :property_name, :description, :available_date, :price, :available

  def initialize(id:, property_name:, description:, available_date:, price:, available:)
    @id = id.to_i
    @property_name = property_name
    @description = description
    @available_date = available_date
    @price = price
    @available = available
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM property;")
    result.map { |row| Listings.new(id: row['id'], property_name: row['property_name'], description: row['description'], available_date: row['available_date'], price: row['price'], available: row['available']) }
  end

  def self.create(property_name:, description:, available_date:, price:, available:)
    DatabaseConnection.query("INSERT INTO property (property_name, description, available_date, price, available) VALUES ('#{property_name}', '#{description}', '#{available_date}', '#{price}', 'TRUE');")
  end

  def self.select(id:)
    result = DatabaseConnection.query("SELECT * FROM property WHERE id=#{id};")
    Listings.new(id: result[0]['id'], property_name: result[0]['property_name'], description: result[0]['description'], available_date: result[0]['available_date'], price: result[0]['price'], available: result[0]['available'])
  end

  def self.booked(id:)
    result = DatabaseConnection.query("UPDATE property SET available = 'FALSE' WHERE id = #{id}; ")
  end 

end
