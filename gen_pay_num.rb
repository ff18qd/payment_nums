
def generate(digit_needed, x)
    # digit_needed is the total digits that are required to be generated, ex generate 10 digit this argument will be 10
    # x is length of repeating numbers which is not allowed in generated digits
    last_digit = -1
    same_length = 0
    # generate first random digit
    result = ""
    next_digit = rand(10)
    while (result.size() < digit_needed) do 
      
      if next_digit != last_digit 
         result.concat(next_digit.to_s)
         last_digit = next_digit
         same_length = 0  
      elsif same_length + 2 < x 
         result.concat(next_digit.to_s)
         same_length += 1
        
      end 
     
      next_digit = rand(10)    

    end
    return result
    
end


puts generate(5,3)