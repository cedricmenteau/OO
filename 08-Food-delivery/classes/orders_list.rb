class OrdersList
	def initialize
		# Create two internal lists: pending orders and ready orders
		# They will be handled as FIFOs (First In - First Out), which
		# means we'll add orders at the *beginning* of the arrays, and
		# take them out from the end.
		@pending_list = []
		@ready_list = []
	end

	# Add an order to the orders list: if it's ready, add it to the top
	# of the ready list. Otherwise, consider it a pending order and add
	# it to the top of the pending list.
	def add_order(order)
		if order.status == :ready
			@ready_list.unshift(order)
		else
			order.status = :pending
			@pending_list.unshift(order)
		end
	end

	def all_pending
		@pending_list.dup
	end

	def all_ready
		@ready_list.dup
	end

	# Remove the oldest order from the pending list and return it
	def next_to_prepare
		@pending_list.pop
	end

	# Remove the oldest order from the ready list and return it
	def next_to_deliver
		@ready_list.pop
	end
end