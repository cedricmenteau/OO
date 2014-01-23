# encoding: UTF-8

class OrderItem
	attr_accessor :quantity
	attr_reader :name, :unit_price

	def initialize(name, quantity, unit_price)
		@name = name
		@quantity = quantity
		@unit_price = unit_price
	end

	def total_price
		@quantity * @unit_price
	end

	def to_s
		"#{name}    x#{@quantity}      #{total_price} €"
	end
end