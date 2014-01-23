# encoding: UTF-8

require_relative 'orders_list'
require_relative 'inventory_item'

require_relative 'contact'
require_relative 'person'

require_relative 'menu_action'

class Restaurant
	attr_accessor :name
	attr_reader :orders, :employees, :customers, :contact, :order_history

	def initialize(name, contact = {})
		@name = name
		@contact = Contact.new(contact)
		@orders = OrdersList.new
		@employees = {}
		@customers = []
		@inventory = []
		@order_history = []
	end

	def add_inventory_item(name, unit_price)
		@inventory << InventoryItem.new(name, unit_price)
	end

	def inventory
		@inventory.sort!
	end

	def add_employee(employee)
		employee.employer = self
		@employees[employee.name] = employee
	end

	def add_customer(customer)
		@customers << customer
	end	

	def repl
		actions = available_actions

		puts "Welcome to #{@name} Restaurant!"

		while true
			employee = nil
			wrong_password = true

			# Identification loop
			while employee.nil? or wrong_password
				print "Please identify yourself: "
				name = gets.chomp
				employee = @employees[name]

				if employee
					puts "All right #{employee.name}, enter your password:"
					print '> '
					password = gets.chomp
					wrong_password = password != employee.password
					puts "Incorrect password!!" if wrong_password					
				end
			end

			puts "Welcome, #{employee.name}!"
			puts "You are a #{employee.class.to_s}."
			
			# Menu loop						
			while true
				possible_actions = []

				# Display all possible actions (ie. filter by access_level)
				puts "What would you like to do?"
				actions.each do |action|
					if action.access_level <= employee.access_level
						possible_actions << action						
						puts "#{possible_actions.length}. #{action.title}"
					end
				end
				puts "#{possible_actions.length + 1}. Log out"

				# Get the user's choice
				print '> '
				choice = gets.chomp.to_i
				
				# Try again if incorrect input
				redo if choice <= 0
				# Loop back to the very beginning if logging out
				break if choice >= possible_actions.length + 1

				# Check again the action's required access level
				action = possible_actions[choice - 1]
				if action.access_level > employee.access_level
					puts "You don't have permission to do that!"
					redo
				end

				# Execute the action (ie. the block that was given when 
				# creating the MenuAction instance)
				action.run(self, employee)
			end
		end

		puts "Bye bye!"
	end

	def available_actions
		# This syntax does the following: if @actions is nil, assign it the given
		# Array and return it. If it's not nil, just return its values.
		# This is a quick way to creating a complex object only once in the lifetime
		# of an instance.
		@actions ||= [
			# Action to list all customers of the restaurant
			MenuAction.new('List customers', 100) do |restaurant, employee|
				puts "------"
				puts "All customers:"
				
				restaurant.customers.each { |c| puts "#{c.to_s}\n----\n" }

				puts "#{restaurant.customers.length} customers ------"
			end,


			# Action to add a new customer
			MenuAction.new('Add customer', 100) do |restaurant, employee|
				puts "------"
				print "New customer name: "
				name = gets.chomp

				contact = {}
				print "address: "
				contact[:address] = gets.chomp

				print "postal code: "
				contact[:postal_code] = gets.chomp

				print "city: "
				contact[:city] = gets.chomp

				print "phone number: "
				contact[:phone] = gets.chomp
				puts "------"

				restaurant.add_customer(Person.new(name, contact))
			end,
			


			# Action to list all orders of the restaurant
			MenuAction.new('List orders', 10) do |restaurant, employee|
				if employee.can?(:cook) or employee.can?(:manage)
					orders = restaurant.orders.all_pending
					puts "Pending orders: #{orders.length} ----"
					puts orders
				end

				if employee.can?(:deliver) or employee.can?(:manage)
					orders = restaurant.orders.all_ready
					puts "Ready orders: #{orders.length} ----"
					puts orders
				end
			end,



			# Action to add a new order
			MenuAction.new('Add an order', 100) do |restaurant, employee|
				puts "------"
				puts "Select the customer:"
								
				restaurant.customers.each_with_index { |c, idx| puts "#{idx+1}. #{c.to_s}\n" }

				customer = nil
				while customer.nil?
					print '> '
					choice = gets.chomp.to_i
					begin
						customer = restaurant.customers[choice - 1]
					rescue
						# just make sure we don't crash when choice-1 < 0
					end
				end

				order = employee.take_order(restaurant.inventory, customer)
				restaurant.orders.add_order(order)
			end,


			# Action to request next order to be prepared
			MenuAction.new('Prepare an order', 10) do |restaurant, employee|
				if employee.can?(:cook)
					# Pull the next order to prepare
					order = restaurant.orders.next_to_prepare

					if order.nil?
						puts "Nothing to do!"
					else
						# Prepare the order and add it back to the ready list
						employee.prepare_order(order)						
						restaurant.orders.add_order(order)
					end
				else
					puts "Get out of that kitchen!!"										
				end
			end,

			# Action to request next order to be prepared
			MenuAction.new('Deliver an order', 10) do |restaurant, employee|
				if employee.can?(:deliver)
					# Pull the next order to deliver
					order = restaurant.orders.next_to_deliver

					if order.nil?
						puts "Nothing to deliver!"
					else
						# Deliver this order and put it in our history of orders
						employee.deliver_order(order)
						restaurant.order_history << order
					end
				else
					puts "C'mon grandma, you can't even drive!"						
				end
			end
		]
	end
end