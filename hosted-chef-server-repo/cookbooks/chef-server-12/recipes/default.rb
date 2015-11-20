#
# Cookbook Name:: chef-server-12
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_url = node['chef-server-12']['url']
package_name = ::File.basename(package_url)
package_local_path = "/tmp/#{package_name}"

# package is remote, let's download it

#remote_file package_local_path do
#  source package_url
#end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Rpm
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
end

# reconfigure the installation

execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end


execute 'chef-server-user-create' do
  command 'chef-server-ctl user-create sandeep-admin Sandeep Singh sdp.uturn@gmail.com --filename /tmp/sandeep-admin.pem'
  not_if { ::File.exists? '/tmp/sandeep-admin.pem'}
end

execute 'chef-server-org-create' do 
  command 'chef-server-ctl org-create learningchef "Devops jurney of dummy" --associaton sandeep-admin --filename /tmp/learningchef-validator.pem'
  not_if { ::File.exists? 'learningchef-validator.pem' }
end

execute 'chef-server-UI-install' do 
  command 'chef-server-ctl install opscode-manage; opscode-manage-ctl reconfigure; chef-server-ctl reconfigure '
#  not_if { ::File.exists? 'need to check'}
end
