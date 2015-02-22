require 'chef/data_bag'
ruby_block "block1" do
    block do
        node.default['test']['foo'] = ['http://docs.chef.io/_static/chef_html_logo.png']
        puts "in block1"
    end
    action :create
end
=begin
remote_file "c:/temp" do
    puts "in remote_file"
    source lazy { node['test']['foo'] }
end
=end

#How to create databag item

=begin
unless Chef::DataBag.list.key?('unique_name')
  new_databag = Chef::DataBag.new
  new_databag.name('unique_name')
  new_databag.save
end
=end
