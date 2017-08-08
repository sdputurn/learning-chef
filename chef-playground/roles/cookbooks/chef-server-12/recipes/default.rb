#
# Cookbook Name:: chef-server-12
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_url = node['chef-server-12']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

# package is remote, let's download it
remote_file package_local_path do
  source package_url
end

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