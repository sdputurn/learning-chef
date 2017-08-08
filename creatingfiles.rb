directory '/tmp/learn-chef/creatingfiles' do 
  owner 'vagrant'
  group 'vagrant'
  mode  '0744'
  recursive true
  action :create
end

(1..20).each do |num|
	puts num
	file "/tmp/learn-chef/creatingfiles/file#{num}" do
		action :create
	end
end