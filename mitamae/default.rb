package 'unzip'
package 'tig'

ENV["USER"] = ENV["HOME"].split("/").last

host_os = RbConfig::CONFIG['host_os']
case host_os
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  :windows
when /darwin|mac os/
  ENV["GROUP"] = "staff"
when /linux/
  ENV["GROUP"] = ENV["USER"]
when /solaris|bsd/
  :unix
else
  :unknown
end

include_recipe "asdf/default.rb"
include_recipe "fish/default.rb"
include_recipe "fish-theme/default.rb"

include_recipe "bat/default"
include_recipe "peco/default.rb"
include_recipe "ghq/default.rb"
