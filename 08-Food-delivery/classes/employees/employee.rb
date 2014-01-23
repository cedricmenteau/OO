require_relative '../person.rb'

class Employee < Person
	##### Class-level stuff
	@ACCESS_LEVEL = 0
	class << self
		attr_reader :ACCESS_LEVEL
	end

	def self.to_s
		"mere employee"
	end
	#####

	attr_accessor :employer, :password

	def initialize(name, password, contact = {})
		super(name, contact)
		@password = password
		@employer = employer			
	end

	# Return what an employee can do, which is nothing by default.
	# Subclasses must override this method
	def capabilities
		@capabilities ||= []
	end

	# Check whether an employee can perform the given action
	def can?(action)
		capabilities.include?(action)
	end

	# This method returns the ACCESS_LEVEL from the class of an 
	# Employee (or its subclasses) instance
	def access_level
		self.class.ACCESS_LEVEL
	end
end