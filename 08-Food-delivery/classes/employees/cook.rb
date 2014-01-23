require_relative 'employee.rb'

class Cook < Employee
	@ACCESS_LEVEL = 10

	def self.to_s
		"cook"
	end

	def prepare_order(order)
		puts "Let's get the order ##{order.num} ready"
		
		cook(order)
		order.status = :ready

		puts "ding!"
		order
	end

	# Return what a cook can do
	def capabilities
		@capabilities ||= [:cook]
	end


	private

	def cook(order)
		# Let's cook something!
		puts "Lalala I'm cooking!"
		true
	end
end