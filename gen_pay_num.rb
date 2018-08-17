require 'csv'

class PaymentNum
    def generate(digit_needed, x)
        # digit_needed is the total digits that are required to be generated, ex. generate 10 digits this argument will be 10
        # x is length of repeating numbers which is not allowed in generated digits
        # last_digit last digit generated, initial value is set to -1
        # same_length length of same digits in the generated numbers, default is 1. If numbers are like 255, same_length would be 2
        last_digit = -1
        same_length = 1
        # init return result as an empty string, to avoid 0123456789 saving into csv file the first 0 being omitted, the result will be a string(text)
        result = ""
        # generate first random digit
        next_digit = rand(10)
        # while loop will end until we get digit_needed digit of numbers, ex. 10 numbers in our case
        while (result.size() < digit_needed) do 
        # assert if there are same digits in sequence, increase same_length and check if same_length is greater than x. If not, it is a valid digit add it to result
        # otherwise generate a new digit and continue the while loop
        # assert new generated digit and last generated digit is the same or not. If not, reset same_length to 1 and concat new digit to result
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
    
    def self.read(path)
        filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + path
        exist_numbers = []
        CSV.foreach(filename) do |row|
          exist_numbers << row[0]
        end
        exist_numbers
    end 
    
    def self.save(path, digit_needed, x)
        filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + path
        exist_numbers = self.read(path)
        # check if this payment number is already exsited, if so generate another one until generate a non exsiting one
        new_pay = self.new
        insert_record = new_pay.generate(digit_needed, x)
        while (exist_numbers.include?(insert_record)) do 
            insert_record = new_pay.generate(digit_needed, x)
            
        end 
        
        # write to csv file as a new row
        CSV.open(filename, "ab") do |csv|
            # generate a new row with value of new payment numbers     
            row = [].push(insert_record)
            # insert the new row to existing csv file
            csv << row
        end        
        puts insert_record
    end 
    
end 

# puts PaymentNum.read('/payment-number/test_demo.csv')

# PaymentNum.save('/payment-number/test_demo.csv', 10, 4)

# test inserts the duplicated record into the csv file
filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/payment-number/test_demo.csv'
exist_numbers = PaymentNum.read('/payment-number/test_demo.csv')
insert_record = "4520501496"
new_pay = PaymentNum.new
while (exist_numbers.include?(insert_record)) do 
    puts "Duplicated!"
    insert_record = new_pay.generate(10, 4)
end 

CSV.open(filename, "ab") do |csv|
    # generate a new row with value of new payment numbers     
    row = [].push(insert_record)
    # insert the new row to existing csv file
    csv << row
    end        
puts insert_record

# # use built-in CSV library to read csv file and save the existing numbers in an array exist_numbers
# require 'csv'

# filename = File.dirname(File.dirname(File.expand_path(__FILE__))) + '/payment-number/test_demo.csv'
# exist_numbers = []
# CSV.foreach(filename) do |row|
#   exist_numbers << row[0]
# end

# # generate a new payment numbers
# insert_record = generate(10,4)

# # check if this payment number is already exsited, if so generate another one until generate a non exsiting one
# while (exist_numbers.include?(insert_record)) do 
#     insert_record = generate(10,4)
    
# end 

# # write to csv file as a new row
# CSV.open(filename, "ab") do |csv|
#     # generate a new row with value of new payment numbers     
#     row = [].push(insert_record)
#     # insert the new row to existing csv file
#     csv << row
# end



# write test

# https://snippets.aktagon.com/snippets/246-how-to-parse-csv-data-with-ruby