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

node.default['test1-motd']['secret_key'] = '/tmp/encrypted_data_bag_secret'
my_data_bag_secret_key = Chef::EncryptedDataBagItem.load_secret( node['test1-motd']['secret_key'])
user_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'test-user-sandeep2-password', 'my_data_bag_secret_key')
user 'sandeep2' do
  comment 'test user for testing encrepted data bag'
  password user_password_data_bag_item['password']
end

file '/tmp/test_file_data_bag_content' do 
  content " data bag content  = #{user_password_data_bag_item['password']} "
end


  
