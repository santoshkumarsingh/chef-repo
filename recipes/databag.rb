ruby_block "data_bag" do
	block do
		sam = {
		  "id" => "sam",
		  "Full Name" => "Sammy",
		  "shell" => "/bin/zsh"
		}
		
		databag_item = Chef::DataBagItem.new
		databag_item.data_bag("users")
		databag_item.raw_data = sam
		databag_item.save
		puts "Data bag creation"
	end
	action:create
end