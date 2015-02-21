#Pass Environment variable from recipe
ENV['MESSAGE'] = 'Hello from Chef'

Chef::Resource::User.send(:include, ::Helper)

file "c:/temp/a.txt" do 
	content "Hello world"
end

directory "c:/santosh" do
	action:create
end

chef_repo "Ohai" do
  title "Chef"
  action :create
end

#http://docs.opscode.com/resource_batch.html
batch "Output directory list" do
  code "dir C:\\"
  action :run
end

#Override default attribute
node.override[:chef_repo][:v]="1.85"
execute 'echo the path attribute' do
  command "echo #{node[:chef_repo][:v]}"
end

file "c:/temp/a.txt" do 
	content "Hello world"
	only_if { has_bacon? }
end