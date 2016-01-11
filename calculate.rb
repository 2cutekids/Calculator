class Calculate

  attr_accessor :mult_div_done, :add_sub_done

  def initialize()
    @mult_div_done = false
    @add_sub_done = false
  end



  def read_expression
    gets().chomp
  end
  def validate_expression(str)
    # valid expressiona eamples
    # 10 * 20 + 30 - 40 / 50
    # 10.0 + 20.0 * 5
    # 10
    # invalid expression examples
    #10k
    #10.9a

    raise StandardError, "This is not a valid expression for this calculator" unless str =~ /^\s*(\d+(?:\.\d+)?)(?:\s*([\*\/\+\-])\s*(\d+(?:\.\d+)?)*)*$/
  end

  def get_equation
      str = read_expression
      validate_expression(str)
      str
  end

  def calculate_expression(str)

    #if * or / found in expresion calulate it
    if !mult_div_done
      rc = str.sub!(/\s*(\d+(?:\.\d+)?)?(?:\s*([\*\/])\s*(\d+(?:\.\d+)?)?)/) {@result = calculate($1,$3, $2)}
      if $2  # continue evaluating all * and /
        calculate_expression(str)
      else
        self.mult_div_done= true  # do not check for * or / anymore all handled
      end
    end
    #if + or - found in expresion calulate it
    if !add_sub_done
        rc = str.sub!(/\s*(\d+(?:\.\d+)?)?(?:\s*([\+\-])\s*(\d+(?:\.\d+)?)?)/)  {@result = calculate($1,$3, $2)}
        if $2 # continue evaluating all + and -
          calculate_expression(str)
        else
          self.add_sub_done= true # do not check for + or - anymore all handled
        end
    end
    return @result.nil?   ?   str :  @result
    @result
  end

  # operand1 and operand2 are numbers and op should be either *,/,+.- or null if operators not found
  def calculate(operand1, operand2, op)
      return operand1 unless op
      raise ZeroDivisionError if operand2.to_i == 0 and op == "/"
      operand1.to_f.send(op, operand2.to_f).to_s
  end
end
