require 'pg'

task :setup do
  connection = PG.connect
  connection.exec('DROP DATABASE IF EXISTS ssbnb;')
  connection.exec('CREATE DATABASE ssbnb;')

  connection.exec('DROP DATABASE IF EXISTS ssbnb_test;')
  connection.exec('CREATE DATABASE ssbnb_test;')

  connection = PG.connect :dbname => 'ssbnb';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(40), password VARCHAR(40));')
  connection.exec('CREATE TABLE property (id SERIAL PRIMARY KEY, property_name VARCHAR(40), description VARCHAR(300), available_date DATE, price INTEGER, available BOOLEAN);')

  connection = PG.connect :dbname => 'ssbnb_test';
  connection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(40), email VARCHAR(40), password VARCHAR(40));')
  connection.exec('CREATE TABLE property (id SERIAL PRIMARY KEY, property_name VARCHAR(40), description VARCHAR(300), available_date DATE, price INTEGER, available BOOLEAN);')
end
