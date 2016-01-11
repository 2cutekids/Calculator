require "./calculate.rb"
begin
  calc = Calculate.new()
  str = calc.get_equation()
  num = calc.calculate_expression(str)
  puts "Result = #{str}"
rescue ZeroDivisionError
  puts "Im Sorry.  Cannot Divide by 0"
rescue StandardError => e
  puts "Im Sorry: " + e.message
end
