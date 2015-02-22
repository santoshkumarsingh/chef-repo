# In Chef, when a resource is defined all its variables are evaluated during
# compile time and the execution of the resource takes place in converge phase.
# So if the value of a particular attribute is changed in converge
# (and not in compile) the resource will be executed with the old value.
 
# Example problem:
# Let's consider this situation where there are two steps involved in a recipe
# Step 1 is a Ruby block that changes a node attribute. Rubyblocks get executed
# in converge phase
# Step 2 is a Chef resource that makes use of the node attribute that was
# changed in Step 1
 
# ============= Without any modification to normal behavior ================= #

#Chef::Resource::Notification.new("template[#{app_root}/#{applet_name}/local_settings.py", :create)
 
#node[:test][:content] = "old content"
 
# Step 1
#ruby_block "step1" do
 # block do
  #  node[:test][:content] = "new content"
  #end
#end
 
# Step 2
#file "/tmp/some_file" do
 # owner "root"
  #group "root"
  #content node[:test][:content]
#end
 
# =========================================================================== #
# file resource will still have the old content as it is set in the compile
# phase.
 
# ========================== With modified code ============================= #
 

node.override[:test][:content]="old content"
 
# Step 1
ruby_block "step1" do
  block do
 #   node[:test][:content] = "new_content"
 node.override[:test][:content]="santosh content"
 
    # Dynamically set the file resource's attribute
    # Obtain the desired resource from resource_collection
    file_r = run_context.resource_collection.find(:file => "/tmp/some_file")
    # Update the content attribute
    file_r.content node[:test][:content]
  end
end
 
# Step 2
file "/tmp/some_file" do
 
  content node[:test][:content]
end
 