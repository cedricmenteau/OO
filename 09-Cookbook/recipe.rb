class Recipe

	attr_accessor :title, :length

  def initialize(title, length)
  	@title, @length = title, length
  end

  def to_s
  	"Name : #{@title} \nLength : #{@length} min"
  end
end