require './lib/database_connection'

if ENV['RACK_ENV'] == "test"
  DatabaseConnection.setup('ssbnb_test')
else
  DatabaseConnection.setup('ssbnb')
end
