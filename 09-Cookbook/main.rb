require_relative"cookbook"

cookbook = Cookbook.new("c:/Users/EstelleAbn/Documents/GitHub/Wagon/OO/09-Cookbook/recipes.csv")

#puts "Which recipe do you wanna add ?"
#my_new_recipe = Recipe.new(gets.chomp)

#fun_cookbook.add_recipe(my_new_recipe)
puts "Bienvenue sur notre SUPER COOKBOOK \nQue souhaitez-vous faire ?" 
while true
	puts "Liste des recettes : (1) \nAjouter des recettes : (2) \nSortir de ce programme : (3)"
	user_action = gets.chomp.to_i

	case user_action
	when 1
		puts cookbook.recipes
	when 2
    puts "Que voulez-vous ajouter, monsieur ?"
    my_recipe = gets.chomp
    puts "Quelle est la duree estimee pour cette preparation culinaire a base de denrees exceptionnelles ?"
    my_length = gets.chomp
    puts "Merci, honorable seigneur"
    cookbook.add_recipe(my_recipe, my_length)
	when 3
    break
	end
end
