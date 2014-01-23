require_relative 'contact.rb'

class Person
	attr_accessor :name
	attr_reader :contact

	def initialize(name, contact = {})
		@name = name
		@contact = Contact.new(contact)
	end

	def to_s
		"#{@name}\n#{@contact.to_s}"
	end
end