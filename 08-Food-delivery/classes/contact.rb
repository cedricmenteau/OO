class Contact
	attr_accessor :address, :city, :postal_code, :phone

	def initialize(fields = {})
		# Initialize the Contact object with all given fields 
		# if a writer accessor exists for it
		fields.each do |field, value|
			method = "#{field.to_s}=".to_sym
			self.send(method, value) if respond_to?(method)
		end
	end

	# Nicer to_s method
	def to_s
		"#{@address}\n#{@postal_code} #{@city}\nT: #{@phone}"
	end
end