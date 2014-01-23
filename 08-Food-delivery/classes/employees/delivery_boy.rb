require_relative 'employee.rb'

class DeliveryBoy < Employee
	@ACCESS_LEVEL = 10

	def self.to_s
		"delivery boy"
	end

	def deliver_order(order)
		puts "Delivering order ##{order.num}"
		drive_to(order.customer.contact)
		
		# Hi! Here's your order :)
		order.status = :delivered

		drive_to(employer.contact)
		puts "Reporting for duty!"
		order
	end

	# Return what an delivery boy can do
	def capabilities
		@capabilities ||= [:deliver]
	end


	private

	def drive_to(contact)
		# Get on the moped and go!
		puts "I'm driving to:"
		puts contact

		true
	end
end