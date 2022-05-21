require "faker"

module Generators
  class Employees

    def initialize
      @employees = []
      @template = "INSERT INTO zaposlenici (ime, prezime, email, drzava) " \
                 "VALUES ('%{fn}', '%{ln}', '%{email}', '%{country}');"
    end

    def generate
      n = ENV["employee_count"].to_i
      n.times do |i|
        row = create_employee
        @employees << row
      end

      @employees.join("\n") + "\n\nCOMMIT;\n\n"
    end

    def create_employee
      fn = Faker::Name.first_name.clean
      ln = Faker::Name.last_name.clean
      email = "#{rand(1..1000)}#{Faker::Internet.email}"
      country = Faker::Address.country.clean

      @template % {fn: fn, ln: ln, email: email, country: country}
    end
  end
end