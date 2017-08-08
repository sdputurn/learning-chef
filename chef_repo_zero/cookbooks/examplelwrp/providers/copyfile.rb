require 'chef/log'
# require 'webhdfs'
#

#
use_inline_resources
#
# To enable -W/--why-run option of chef-client
#
def whyrun_supported?
   true
end
#
# Method automatically called by Chef during the client execution phase
# Can be used to initialize variables and also verify the current state
#
# def load_current_resource
#    @current_resource = Chef::Resource::ExamplelwrpCopyfile.new(new_resource.name)
#    new_resource.user == nil ? @current_resource.user = ENV['USER'] : @current_resource.user = new_resource.user
# end

action :create do
  # directory new_resource.file1 do
  #   owner 'root'
  #   group 'root'
  #   mode '0755'
  #   action :create
  # end
  
  if create_directory(new_resource.file1) == "Pass"
    Chef::Log.info("create request returned pass")
    new_resource.updated_by_last_action(true)
  end
  # if (file_exists?(@file1))
  #   Chef::Log::info("Directory #{ @file1 } exits; create action not taken")
  # else
  #   converge_by("Create #{ @new_resource }") do
  #     @client.mkdir(@file1,'permission' => @mode)
  #   end
  #   new_resource.updated_by_last_action(true)
  # end
end

def create_directory(file1)
  if Dir.exist?(file1)
    return "directory exist"
  else
    Dir.mkdir(file1) unless Dir.exist?(file1)
  end
  return "Pass"
end