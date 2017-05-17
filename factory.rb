class Factory

	def self.new (*args, &block)

		dynamic_class = Class.new do
			args.each do |var|
				self.send(:attr_accessor, var)
			end

			define_method :initialize do |*init_args|
				args.each_with_index do |val, index|
					instance_variable_set("@#{val}", init_args[index])
				end

				@varaibles_array = init_args
			end

			define_method :[] do |arg|
				if arg.is_a? Fixnum
					@varaibles_array[arg] 
				else
					self.send(arg.to_sym)
				end
			end
		end
		dynamic_class.class_eval &block if block
		dynamic_class
	end
end