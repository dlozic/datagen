require "faker"

module Generators
  class Orders

    def initialize
      @orders = []
      @template = "INSERT INTO narudzbe (datum_narudzbe, racun_izdao_id, adresa, zip, cijena_bez_pdv, cijena_ukupno) "\
                "VALUES (DATE '%{ord_date}', %{emp_id}, '%{address}', '%{zip}', %{price1}, %{price2});"
    end

    def generate
      n = ENV["order_count"].to_i
      n.times do |i|
        row = create_order
        @orders << row
      end

      @orders.join("\n") + "\n\nCOMMIT;\n\n"
    end

    def create_order
      ord_date = Faker::Date.between(from: '1990-01-01', to: Date.today)
      emp_id = rand(1..(ENV["employee_count"].to_i))
      address = Faker::Address.full_address.clean
      zip = Faker::Address.zip
      price1 = rand(50..5000)
      price2 = price1 * 1.25

      @template % {ord_date: ord_date, emp_id: emp_id, address: address, zip: zip, price1: price1, price2: price2}
    end
  end
end