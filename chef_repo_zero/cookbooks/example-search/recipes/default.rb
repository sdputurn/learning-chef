#
# Cookbook:: example-search
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


Chef::Log.info("this is a important message")
search("users", "*:*").each do |matched_nodes|
	Chef::Log.info(matched_nodes.to_s)
	puts matched_nodes['username'], matched_nodes['access']
	# puts node[matched_nodes.to_s]['ipaddress']
end

search("users", "*:*").each do |user_data|
	puts "user_data", user_data.to_s
	user user_data["id"] do
		comment user_data['access']
		action :remove
	end
end

node.default['local_file_handling']['name'] = "main_attribute"
include_recipe 'example-search::local_file_handling'

include_recipe 'example-depends'

user 'a-user' do
	action :remove
end

ExampleSearch_copyfile '/tmp/lwrp' do
	file2 '/tmp/lwrp/2'
end
