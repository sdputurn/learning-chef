#
# Cookbook:: example-depends
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# node.default['local_file_handling']['name'] = "depends_attribute"
log "this is an import tant message from depends cookbook"
log node['local_file_handling']['name']