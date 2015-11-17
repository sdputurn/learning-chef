current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sandeep-admin"
client_key               "#{current_dir}/sandeep-admin.pem"
validation_client_name   "learningchef-dev-validator"
validation_key           "#{current_dir}/learningchef-dev-validator.pem"
chef_server_url          "https://default-centos65/organizations/learningchef-dev"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
