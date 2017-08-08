# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html

actions :create
# action :create #, :delete, :chown, :chmod, :rename, :chgrp
default_action :create
# default_action :copy

attribute :file1, :kind_of => String, :required => true, :name_attribute => true
attribute :file2, :kind_of => String, :required => true