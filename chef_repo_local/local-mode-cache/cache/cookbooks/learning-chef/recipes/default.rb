#
# Cookbook:: learning-chef
# Recipe:: default
#
# Copyright:: 2017, Verizon Inc., All Rights Reserved.


file "#{ENV['HOME']}/stone.txt" do |test|
	content "Welcome to chef #{node['platform_family']}"
	
end
# puts "this is test message for chef-client"
log "Hello, this is an important message."

cookbook_file "#{ENV['HOME']}/motd" do
  source "#{node['platform_family']}-motd"
  mode '0644'
end
(1..10).each do |name|
	puts name
end

# package 'httpd' do
#   action :install
# end

# service 'httpd' do
#   supports :status => true, :restart => true, :reload => true
#   action [:start, :enable]
# end

# template '/var/www/html/index.html' do
#   source 'httpd-index.html.erb'
#   owner 'root'
#   group 'root'
#   mode '0644'
# end

# attributes examples

node.default['example']['name'] = "sandeep"
node.default[:example][:title] = "singh"

node.default['example'][:company] = "HCL"
# puts node.default['example']['name']
# puts node[:example][:title] 
# puts node['example'][:company]

node[:example].each do |key,value|
	puts key,value
end

search("node", "*:*").each do |matching_node|
log matching_node.to_s
end