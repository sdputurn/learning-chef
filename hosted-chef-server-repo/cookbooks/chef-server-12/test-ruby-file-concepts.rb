#!/bin/ruby

package_url = '/tmp/chef-server-core-12.2.0-1.el6.x86_64.rpm'

package_name = ::File.basename(package_url)
#package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"
puts "#{package_name}"


