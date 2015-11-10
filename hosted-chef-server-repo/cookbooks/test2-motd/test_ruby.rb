#!/bin/ruby
ENV['encrypted_password'] = "dummy"
encrypted_password = "test"
#export encrypted_password ; #ENV['encrypted_password']=$encrypted_password
puts "#{ENV['encrypted_password']}"

#echo " $encrypted_password #{ENV['encrypted_password']} "

