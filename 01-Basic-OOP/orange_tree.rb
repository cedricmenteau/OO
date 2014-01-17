class OrangeTree
  #attr_accessor :height, :age, :oranges
  # no need here => not called, we have our own fancy methods

  def initialize # constructor
    @height = 0
    @oranges = 0
    @age = 0
    @alive = true
  end
  
  def measure_height
    if @alive == false
     puts "Sorry your tree won't grow anymore, it's dead"
    else 
      puts "your tree is #{@height} m tall"
    end
  end
  
  def count_the_oranges
    if @age < 10
      puts "Patience, I'm only a baby tree!"
    elsif @alive == false
      puts "your tree is dead, there will be no more oranges"
    else 
      puts "The tree produced #{@oranges} oranges."
    end
  end 
  
  def pick_an_orange
    if @alive  && @oranges >= 1
       @oranges -= 1
    puts "You now have #{@oranges}"
    else @alive == false
    puts "Go back to ur mom"
    end
  end
  
  def one_year_passes
    return "i'm dead birch!" if !@alive

    @age += 1
    @height += 0.4
    death_luck = rand(1..10)
    
    if @age > 30 && death_luck > 6
      @alive = false
      message = "i'm dead birch!"
    elsif @age >= 10
       @oranges += @age * 6 
       message = "you tree is young and fruitfull.. #{@oranges} oranges this year"
    elsif @age < 10 and @alive
       message = "you tree is still a baby.. Wait for a while"
    end
   
    return message
  end

end

our_tree = OrangeTree.new
50.times() { puts our_tree.one_year_passes }