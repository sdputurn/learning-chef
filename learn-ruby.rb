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
VAR=5
$global_script_no = 1
# $class_var = 'test'
class Customer
    @@no_of_customers = 0
    TOTAL_COUNT = 10
    @@class_var = 'test'
    cons_var = 'constant_var' #this variable can not be referenced any where inside class definations as this is local variable however constants are accesssible
    Cons_var  = 'constant_var'
    puts '++++++++++++',cons_var #this pattern printed once does not matter how many instance you create. may be when the first tme class instance is created in memory
    def initialize(id,name,address)
        @name = name
        @id = id
        @address = address
        @@no_of_customers = @@no_of_customers + 1
        # TOTAL_COUNT = TOTAL_COUNT+1
    end
    def display(my_var)
        puts "name - #{@name}, mesg - #{my_var}"
        new_var  = VAR + 10
        puts "script lcal variable - #{new_var}"
        $global_script_no = 2
        puts " global_script_no - #{$global_script_no}"
        
    end
    def display_count()
        puts "no of cutomers - #{@@no_of_customers} " #, @@no_of_customers
    end
    def return_var (my_var = 'test')
        puts Cons_var
        puts @@class_var
        if my_var == @@class_var
            return @@class_var+' hi'
        else
            return my_var
        end
    end

end
# o1 = Customer.new(1,'sandeep','ejipura')
# o2 = Customer.new(2,'bob','bangalore')
# o1.display 'alice in wonderland'
# o2.display ('bob in disney')
# puts '++++++++++++++++++++++'
# puts o1.return_var 'hello'
# o1.display_count
# o2.display_count
puts Customer::TOTAL_COUNT
# puts Customer::@@display_count

#ruby variables
var = 1 #local variable
@var = 2 #instance variable
VAR = 3 #constant

VAR = VAR + 1
print var,' ++ ', @var, VAR,"\n"
puts " #{var},  #@var, #{@var} , #{VAR}, #VAR"

require 'json'

filename='input.json'
f=open(filename,'w')
h={"name" => 'alice'}
s= JSON.dump(h)
f.write(s)
f.close()
puts '++++++ file writing completed++++++'
# p '++++++++++++file reading started ++++++++'
f=open(filename,'r')
h=JSON.load(f)
p h
p h['name']
p '++++++++++ file reading completed +++++++++++++'

require 'net/http'

uri = URI('https://jsonplaceholder.typicode.com/posts/1')
r = Net::HTTP.get_response(uri)
puts r.body

uri = URI('https://jsonplaceholder.typicode.com/posts')
r = Net::HTTP.post_form(uri, 'id'=>101, 'title'=> 'my first ruby post')
puts r.body
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

