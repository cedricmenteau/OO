class OrangeTree
  
  attr_accessor :age, :height, :orange

  def initialize
    @age = 0
    @height = 0
    @orange = 0
  end
  
  def measure_height
    if @age < 30
      return "#{@height.round(2)}m"
    else 
      return "Your old dear tree is quite dead."
    end
  end
  
  def count_the_oranges
    if @age < 30
      return "#{@orange} oranges."
    else 
      return "Your old dear tree is quite dead."
    end
  end
  
  def pick_an_orange
    if @age >= 30
      return "Oops... A dead tree is a dead tree dude."
    elsif @age < 10
      return "Be patient, I'm only a child!" 
    elsif @orange > 1
      @orange -= 1
      return "Juiccccyyyyyy!!"
    else 
      return "Too bad... You've eaten all the oranges..." 
    end
  end
  
  def one_year_passes
    @age += 1
    @height += 0.4
    if @age > 30 
      return "Your old dear tree is quite dead."
    elsif @age >= 10
      @orange = @age * 6
    end
    return "This year your tree grew to #{@height.round(2)}m tall and produced #{@orange} oranges."
  end

end

tree = OrangeTree.new
35.times do
  puts "\n"
  puts "***"
  puts tree.one_year_passes
  puts tree.age 
  puts tree.pick_an_orange
  puts tree.count_the_oranges
  puts tree.measure_height
end
puts tree.one_year_passes