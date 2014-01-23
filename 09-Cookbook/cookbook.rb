require_relative "recipe"
require_relative "csv_manager"


class Cookbook

	attr_reader :recipes

	def initialize(file_name)
		@csv_manager = CsvManager.new(file_name)
		@recipes = []
		@csv_manager.rows.each {|row| @recipes << Recipe.new(row[0], row[1]) }
	end

	def add_recipe(title, length)
    @recipes << Recipe.new(title, length)
    @csv_manager.add_row([title, length])
  end

  def delete(idx)
  	@recipes.delete_at(idx)
  	save
  end

  def save
    self.foreach {|line| line.write(line)}
  end
end