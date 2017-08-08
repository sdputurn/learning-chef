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

