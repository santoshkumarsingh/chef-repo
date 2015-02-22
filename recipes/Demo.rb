#Pass Environment variable from recipe
ENV['MESSAGE'] = 'Hello from Chef'

::Chef::Recipe.send(:include, Demo::Helper)
# include Chef::Mixin::Shellout
::Chef::Recipe.send(:include, Chef::Mixin::ShellOut)

my_cmd="dir"
# later in your code ...
output = shell_out! my_cmd

Chef::Log.info "Output: #{ output.stdout }"
Chef::Log.info "Errors: #{ output.stderr }" unless output.stderr.empty?


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
path=getFolder()
file path do 
	content "Hello world"
	
end

