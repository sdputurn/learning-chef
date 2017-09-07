#!/usr/bin/ruby -w

#  muti line string
print <<EOF
this is a muli-line string
# using a placeholder method
EOF

BEGIN {
    puts "initialize ruby program"
}

END {
    puts "end of ruby program"
}
#multi line comment
=begin #not sure why throwing exception syntax error, unexpected '=', expecting end-of-input
    this comment1 
    this is comment2
=end
class Customer
    @@no_of_customers = 0
    TOTAL_COUNT = 0
    def initialize(id,name,address)
        @name = name
        @id = id
        @address = address
        @@no_of_customers = @@no_of_customers + 1
        # TOTAL_COUNT = TOTAL_COUNT+1
    end
    def display
        puts "name - #{@name}"
    end
    def display_count()
        puts "no of cutomers - #{@@no_of_customers} " #, @@no_of_customers
    end
end
o1 = Customer.new(1,'sandeep','ejipura')
o2 = Customer.new(2,'bob','bangalore')
o1.display()
o2.display()
# o1.display_count
# o2.display_count
puts Customer::TOTAL_COUNT
# puts Customer::@@display_count

#ruby variables
var = 1 #local variable
@var = 2 #instance variable
VAR = 3 #constant

puts var, @var, VAR
puts " #{var},  #@var, #{@var} , #{VAR}"

#A simple sorting program

# arr = [2,3,10,4,17,18,15]
# # puts "input array - ", arr.join('')
# p "input array - #{arr}"
# for i in (0..arr.length()-1)
#     for j in (i..arr.length()-1)
#         if arr[i] > arr[j]
#             swap = arr[i]
#             arr[i] = arr[j]
#             arr[j] = swap
#         end
#     end
# end

# p "sorted array", arr

# string="sandeep"
# reverse = ''
# for i in (string.length()-1).downto(0)
#     reverse=reverse+string[i]
#     # puts reverse, i
# end
# puts reverse

