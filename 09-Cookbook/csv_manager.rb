require "csv"

class CsvManager

  def initialize(path)
  	@path = path
  end

  def rows
    CSV.read(@path)
  end

  def add_row(row_data)
    CSV.open(@path, "a") do |csv|
	  	csv << row_data
		end
  end

end