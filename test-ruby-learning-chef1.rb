#!/bin/ruby
# Bacon time is every third hour
hour = 3
if hour % 3 == 0
puts "It's BACON time!"
end
puts Math.hypot(43, 57) #=> 71.40028011149536
puts "double quoted string" #=> "double quoted string"
puts 'single quoted string' #=> "single quoted string"
x = "hello"
puts "#{x} world" #=> "hello world"
puts '#{x} world' #=> '#{x} world'
puts "quotes in \"quotes\"" #=> "quotes in \"quotes\""
puts 'quotes in \'quotes\'' #=> "quotes in \"quotes\""
!true #=> false
not true #=> false
not false #=> true
!!true #=> true
not nil #=> true
puts true
nil #=>false
puts false
puts "arrays"
types = ['crispy', 'raw', 'crunchy', 'grilled']
#puts $types.first $types[0]
puts types.length #=> 4
puts types.size #=> 4
#puts types.length types.size

types.push 'smoked' #=> ["crispy", "raw", "crunchy", "grilled", "smoked"]
#puts types.length types.size

#types << 'deep fried' #=> ["crispy", "raw", "crunchy", "grilled","smoked", "deep fried"]
#puts types.length types.size

#types[0] #=> "crispy"
#puts types[0]

types.first #=> "crispy"
puts types.first


types.last #=> "deep fried"
types[0..1] #=> ["crispy", "raw"]
##puts types.all

prices = { oscar: 4.55, boars: 5.23, wright: 4.65, beelers: 6.99 }

puts prices[:oscar]

books = { 'learning-chef' => { 'author' => 'Mischa and Seth' , 'book_price' => 50 }, 'RHEL' => {'author'=>'Micheal', 'book_price'=>60}}

puts books['learning-chef'].values

puts books['learning-chef']['author']

#regular expression
"Bacon is good" =~ /lie/ #=> nil
"Bacon is good" =~ /bacon/ #=> 0
"Bacon is good" !~ /lie/ #=> true

books.select do |book_name, book_details|
puts book_name
puts book_details.values
book_name =~ /learn/
end
if books['RHEL']['book_price']  >60
puts "this can't possibly happen"
elsif hour >3
puts "this won't happen either"
elsif hour == 3
puts "this will definitely happen"
else
puts "this won't happen, because the method is short-circuited"
end

['bacon', 'tomato_sauce'].each do |type|
file "#{ENV['HOME']}/#{type}.txt" do
	content "#{type} is tasty!"
end
end

cron 'weekly_restart' do
weekday '1'
minute '0'
hour '0'
command 'sudo reboot'
end

bash 'echo "hello"'

bash "run_my_code" do 
code <<EOF
mkdir "#{ENV['HOME']}/test-chef-bash-resource-created"
EOF
end

directory '/opt/my/deep/directory' do
owner 'root'
group 'root'
mode '0644'
recursive true
end

#chef_gem 'httparty'

execute 'write status' do
command 'echo "delicious" > /tmp/bacon'
end

#gem_package 'bundler'


link '/tmp/bacon' do
to '/tmp/delicious'
end


package 'httpd'


