
def generate(digit_needed, x)
    # digit_needed is the total digits that are required to be generated, ex generate 10 digit this argument will be 10
    # x is length of repeating numbers which is not allowed in generated digits
    last_digit = -1
    same_length = 1
    # generate first random digit
    result = ""
    next_digit = rand(10)
    while (result.size() < digit_needed) do 
      
      if next_digit != last_digit 
         result.concat(next_digit.to_s)
         last_digit = next_digit
         same_length = 1  
      elsif same_length + 1 < x 
         result.concat(next_digit.to_s)
         same_length += 1
        
      end 
     
      next_digit = rand(10)    

    end
    return result
    
end


# puts generate(6,3)

require 'csv'

filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/payment-number/test_demo.csv'
exist_numbers = []
CSV.foreach(filename) do |row|
  exist_numbers << row[0]
end

puts exist_numbers
insert_record = generate(6,3)
puts "new numbers ".concat(insert_record)
if !exist_numbers.include?(insert_record) 
    CSV.open(filename, "ab") do |csv|
       
        row = [].push(insert_record)
        csv << row
    end
end 


# https://snippets.aktagon.com/snippets/246-how-to-parse-csv-data-with-ruby