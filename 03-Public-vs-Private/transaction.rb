class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.new
    @reason = "no reason given yet."
  end
  
  def to_s
    # Nicely print transaction infos using Time#strftime.
    if @amount > 0
	  "You deposit #{@amount}euros on #{@date.strftime("%d/%m/%Y | %Hh%Mmin")}"
	else 
	  "You withdraw #{@amount}euros on #{@date.strftime("%d/%m/%Y | %Hh%Mmin")}"
	end
  end
end
