# encoding: UTF-8

class Order
	attr_accessor :status
	attr_reader :manager, :customer, :items, :num

	# The Order class maintains a counter for orders numbering
	@order_num = 0
	def self.next_order_num
		@order_num += 1
	end

	# Create an order with a new order number, the current date and :pending status
	def initialize(manager, customer, items = [])
		@num = Order.next_order_num
		@timestamp = Time.now
		@status = :pending

		@manager = manager
		@customer = customer
		@items = items
	end

	def date
		@timestamp.strftime('%Y-%m-%d %H:%M:%S')
	end

	# Total order price is the sum of all its items' price
	def total_price
		@items.reduce(0) { |memo, item| memo + item.total_price }.to_f.round(2)
	end


	# Nicer to_s
	def to_s
		str = <<-EOF
Order ##{@num} - #{date}
------------------------------------------

EOF

		@items.each { |item| str += "#{item.to_s}\n" }

		str += <<-EOF
------------------------------------------
TOTAL: #{total_price.to_f.round(2)} €
------------------------------------------


		EOF

		str
	end
end