# encoding: UTF-8

require './classes/restaurant'

require './classes/employees/cook'
require './classes/employees/delivery_boy'
require './classes/employees/manager'

require './classes/inventory_item'

##### SET UP OUR RESTAURANT #####
wagon_bar = Restaurant.new('Le Wagon Bar', { address: '1 avenue des Champs Elysées', postal_code: 75008, city: "Paris" })

# Add items to the inventory of the restaurant
items = [
	{ name: 'Happy Papillard', price: 10.5 },
	{ name: 'Olive&tomates', price: 10.5 },
	{ name: 'Mack & cheese', price: 10.5 },
	{ name: 'Romano fresh!', price: 10.5 },
	
	{ name: 'Estellartois', price: 6 },
	{ name: 'Nielchips', price: 4.5 },
	{ name: 'Croq\' Mathieu', price: 8 },
	{ name: 'Sébaspain', price: 5 },
	{ name: 'Christillant de poulet', price: 9 },
	{ name: 'Célatine', price: 5 },
	{ name: 'Xu-in-gum', price: 3 },
	{ name: 'Mentaleau', price: 4 }
	# out of inspiration..... :)
]
 
items.each do |item|
	wagon_bar.add_inventory_item(item[:name], item[:price])
end

# Add employees (name & password)
boris = Manager.new('Boris', 'papillard')
wagon_bar.add_employee(boris)
puts "Boris:papillard => Manager"

olivier = Manager.new('Olivier', 'olance')
wagon_bar.add_employee(olivier)
puts "Olivier:olance => Manager"

fred = Cook.new('Frédéric', 'forlicki')
wagon_bar.add_employee(fred)
puts "Frédéric:forlicki => Cook"

edouard = DeliveryBoy.new('Edouard', 'erudolf')
wagon_bar.add_employee(edouard)
puts "Edouard:erudolf => Delivery Boy (yay!)"
################################

puts "\n\n"

# Start the restaurant's REPL
wagon_bar.repl



