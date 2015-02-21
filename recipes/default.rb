#
# Cookbook Name:: helloworld
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#file "c:/temp/santosh1.txt"  do 
 # content "Hello world"
  
  # not_if do ::File.exists?('c:/temp/santosh.txt") end
	
#end

 if ::File.exist?("#{ENV['WINDIR']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
 	
 end
 puts ("#{ENV['WINDIR']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
 puts "#{ENV['WINDIR']}"
 puts "#{ENV['PROCESSOR_ARCHITEW6432']}"
 result = IO.popen("sqlplus").readlines[0].strip
 puts result = IO.popen("sqlplus").readlines.find("SQL")

 