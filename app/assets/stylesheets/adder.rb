require 'minitest/autorun'

class Adder
	def initialize(num1, num2)
		@num1 = num1
		@num2 = num2
	end

	def add
		@num1 + @num2
	end

end

class Testadder < Minitest::Testadder
	def test_adder
		adder = Adder.new(10, 14)
		asser_equal 24, adder.add

	end
end
