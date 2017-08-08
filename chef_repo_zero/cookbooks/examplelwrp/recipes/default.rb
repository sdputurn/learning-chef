#
# Cookbook:: examplelwrp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

examplelwrp_copyfile '/tmp/lwrp' do |name|
	puts name
	file2 '/tmp/lwrp2'
	
end