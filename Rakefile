require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('DROP DATABASE IF EXISTS ssbnb;')
  connection.exec('CREATE DATABASE ssbnb;')

  connection.exec('DROP DATABASE IF EXISTS ssbnb_test;')
  connection.exec('CREATE DATABASE ssbnb_test;')

  connection = PG.connect :dbname => 'ssbnb';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(40), password VARCHAR(240));')
  connection.exec('CREATE TABLE property (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), property_name VARCHAR(40), description VARCHAR(300), available_date DATE, price FLOAT, available BOOLEAN);')
  connection.exec("INSERT INTO users (name, email, password) VALUES ('Sam', 'sam@me.com', 'pass12345');")
  connection.exec("INSERT INTO property (user_id, property_name, description, available_date, price, available) VALUES ('1', 'Sams Manor', 'Palace in the wopwops', '2020-04-03', '4', 'TRUE');")

  connection = PG.connect :dbname => 'ssbnb_test';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(40), password VARCHAR(240));')
  connection.exec('CREATE TABLE property (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), property_name VARCHAR(40), description VARCHAR(300), available_date DATE, price FLOAT, available BOOLEAN);')
  connection.exec("INSERT INTO users (name, email, password) VALUES ('Sam', 'sam@me.com', 'pass12345');")
  connection.exec("INSERT INTO property (user_id, property_name, description, available_date, price, available) VALUES ('1','Sams Manor', 'Palace in the wopwops', '2020-04-03', '4', 'TRUE');")
end

task :test_database_setup do
  p "Clearing database.."

  connection = PG.connect(dbname: 'ssbnb_test')

  connection.exec("TRUNCATE TABLE users RESTART IDENTITY;")
end
