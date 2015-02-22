  module Demo
  	module Helper

    include Chef::Mixin::ShellOut

    def has_bacon?
      cmd = shell_out!('ps', {:returns => [0,2]})
      cmd.stderr.empty? && (cmd.stdout =~ /^bacon/)
    end
    def getFolder
    	"c:\\temp\\sam.txt"
    end
  end
end

