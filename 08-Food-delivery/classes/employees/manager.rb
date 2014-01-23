require_relative 'employee.rb'

require_relative '../order.rb'
require_relative '../order_item.rb'


class Manager < Employee
	@ACCESS_LEVEL = 100

	def self.to_s
		"manager"
	end

	def initialize(name, password, contact = {})
		# Make sure we call the Employee constructor
		super

		@created_orders = []
	end

	# Return what a manager can do
	def capabilities
		@capabilities ||= [:manage]
	end

	def take_order(available_items, customer)
		items = []

		puts "Hello #{customer.name}, I'm #{@name} and I will take your order!"
		
		while true
			# Display the stock
			puts "What should I add to your order?"
			available_items.each_with_index { |item, idx| puts "#{idx}. #{item.to_s}" }
			puts "(Anything greater than #{available_items.length - 1} will end this menu)"
			print '> '

			# Get the customer's choice
			choice = gets.chomp.to_i
			break if choice >= available_items.length

			# Request item quantity
			item = available_items[choice]
			puts "Okay, so you want some #{item.name}! In which quantity?"
			print '> '
			quantity = gets.chomp.to_i

			# Add item to the order
			items << OrderItem.new(item.name, quantity, item.unit_price)
		end

		# Create the order with selected items
		order = Order.new(self, customer, items)
		@created_orders << order

		puts "Thank you #{customer.name}, the order ##{order.num} is on its way!"
		order
	end
	
	# The manager's performance: a powerful tool to know whether
	# your manager is a lazy ass :P
	# Just return the total amount of orders taken by the manager
	def performance
		@created_orders.reduce(0) { |memo, order| memo + order.total_price }
	end
end