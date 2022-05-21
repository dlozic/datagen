require "dotenv"
require_relative "helpers/string"
require_relative "generators/employees"
require_relative "generators/orders"

# loading .env file into ENV variable
Dotenv.load(".env")
# print(ENV["employee_count"])

# generators
employees = Generators::Employees.new
orders = Generators::Orders.new

# create insert into commands
ii1 = employees.generate
ii2 = orders.generate

# creating output
result = File.read(ENV["schema"])
result += ii1 + ii2
File.write(ENV["output_filename"], result)
