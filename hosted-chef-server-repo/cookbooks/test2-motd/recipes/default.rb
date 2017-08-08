#
# Cookbook Name:: test1-motd
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'httpd' do 
  action :install
end

service 'httpd' do 
  action [ :start, :enable ]
end

template '/etc/motd' do
  source 'custom_motd.erb'
end

['bacon', 'eggs', 'sauce'].each do |type|
  file "/tmp/#{type}" do 
    content "#{type} is delicious"
  end
end

free_memory = node['memory']['total']

file '/tmp/free_memory' do 
  content "#{free_memory} bytes free on #{Time.now}"
end 

cookbook_file "#{ENV['HOME']}/chef_managed_test_file.txt" do
  source 'chef_managed_test_file.txt'
end

node.default['test2-motd']['secret_key'] = '/tmp/encrypted_data_bag_secret'
my_data_bag_secret_key = Chef::EncryptedDataBagItem.load_secret( node['test2-motd']['secret_key'])
user_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'test-user-sandeep2-password', 'my_data_bag_secret_key')

##node.default['test2-motd']['data_bag_item_password_content'] = user_password_data_bag_item['passowrd']
node.default['test2-motd']['data_bag_item_password_content'] = "sandeep"

user_password_data_bag_item2 = data_bag_item('passwords', 'test-user-sandeep2-password', IO.read('/tmp/encrypted_data_bag_secret') )

my_secret = IO.read('/tmp/encrypted_data_bag_secret') 

execute "echo #{user_password_data_bag_item2['password']} > /tmp/user_password" do 
end

ENV['encrypted_password'] = "dummy"
execute 'openssl_password_generate' do 
  command "encrypted_password=`echo #{user_password_data_bag_item2['password']} |openssl passwd -1 -stdin  |tr -d '\n\r'` ; export encrypted_password"
#  node.default['test2-motd']['encrypted_password'] = #{encrypted_password}
##  notifies :run , 'user[sandeep2]', :delayed
#  action :nothing
end
puts " encrypted_password = #{ENV['encrypted_password']}"
#node.default['test2-motd']['encrypted_password'] = "test"
#ruby_block 'check_command_output' do
#  block do
#    Chef::Resource::RubyBlock.send(:include, Chef::Mixin::ShellOut)
#    my_command =  "encrypted_password=`echo #{user_password_data_bag_item2['password']} |openssl passwd -1 -stdin  |tr -d '\n\r'` "
#    my_command_out = shell_out(my_command)
#    node['test2-motd']['encrypted_password'] = my_command.stdout
#  end
#end

#open_text_password = IO.read('/tmp/user_encrpted_password')

bash 'run_my_code' do 
  code <<-EOF
    echo "  #{ENV['encrypted_password']} i am created before cookbook_file `date` \n" > /tmp/bash_file
    encrypted_password=`echo #{user_password_data_bag_item2['password']} |openssl passwd -1 -stdin  |tr -d '\n\r'` 
    echo "  #{ENV['encrypted_password']} i am created before cookbook_file `date` \n" >> /tmp/bash_file
    export encrypted_password ; ENV['encrypted_password']=$encrypted_password ;  echo "  #{ENV['encrypted_password']}  $encrypted_password i am created before cookbook_file `date` \n" >> /tmp/bash_file
    echo "  #{ENV['encrypted_password']} i am created before cookbook_file `date` \n" >> /tmp/bash_file
EOF
end


cookbook_file '/tmp/test_cookbook_file' do 
  source 'test_cookbook_file'
end

user 'sandeep2' do
  comment 'test user for testing encrepted data bag'
##  action :nothing
  only_if { ::File.exists?('/tmp/user_encrpted_password') }
  password 'srs@1234'
#  subscribes :run, 'execute[openssl_password_generate]', :immediately
end

file '/tmp/test_file_data_bag_content' do 
  content " data bag content  = #{user_password_data_bag_item2['password']}"
end
file '/tmp/test_file_data_bag_content2' do 
  content "data bag content2: encrypted_password= #{ENV['encrypted_password']} {node['test2-motd']['encrypted_password']} #{node['test2-motd']['data_bag_item_password_content']} #{my_secret} node['test2-motd']['data_bag_item_password_content'] IO.read('/tmp/encrypted_data_bag_secret') \n"
end

