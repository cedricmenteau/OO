class MenuAction
	attr_reader :title, :access_level

	def initialize(title, access_level, &block)
		@title = title
		@access_level = access_level
		@action = block
	end

	def run(*args)
		@action.call(args)
	end
end