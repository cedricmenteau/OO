class Restaurant

	@global_rating = []

	class << self
		attr_accessor :global_rating

		def avg_rating
			Restaurant.global_rating.inject { |sum, element| sum + element } / Restaurant.global_rating.size 
		end
	end

	def initialize(name, address, type_food, rating)
		@name = name
		@address = address
		@type_food = type_food
		@rating = []
		@rating << rating
		Restaurant.global_rating << rating
	end

	def restaurant_rating
		@rating.inject { |sum, element| sum + element } / @rating.size 
	end

	def number_of_ratings
		@rating.count
	end

	def rate(note)
		@rating << note
		Restaurant.global_rating << note
	end
end

chez_momo = Restaurant.new("Chez Momo", "Rue des saligauds", "Charcuterie", 7)
chez_alfred = Restaurant.new("Chez Alfred", "Rue des Pinèdes", "Poissonnerie", 8)

chez_momo.rate(5)
chez_momo.rate(3)
chez_momo.rate(6)

chez_alfred.rate(4)
chez_alfred.rate(7)
chez_alfred.rate(9)

print chez_momo.restaurant_rating
print chez_alfred.restaurant_rating

puts Restaurant.global_rating