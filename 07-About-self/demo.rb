module DemoModule

  def self.introduce
    puts "???. self from module method : #{self.inspect} | #{self.class}"
  end

  class DemoClass  

    puts "1. self from class definition : #{self.inspect} | #{self.class}"

    def introduce
      @whatever = "whatever text"
      puts "???. self from instance method : #{self.inspect} | #{self.class}"
    end

    def self.introduce
      puts "???. self from class method : #{self.inspect} | #{self.class}"
    end    
  end

  puts "???. self from module definition : #{self.inspect} | #{self.class}"

end

DemoModule::introduce
DemoModule::DemoClass.introduce      
DemoModule::DemoClass.new.introduce