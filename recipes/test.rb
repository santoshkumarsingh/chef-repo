file "c:/temp/a.txt" do 
	content "Hello world"
end
directory "c:/santosh" do
	action:create
end
helloworld "Ohai" do
  title "Chef"
  action :create
end