package 'unzip'
package 'tig'

ENV["USER"] = ENV["HOME"].split("/").last

if `uname -a`.include?("Darwin")
  ENV["GROUP"] = "staff"
  ENV["OS"] = "mac"
  ENV["ARCH"] = "arm"
  package 'tmux'
else
  ENV["GROUP"] = ENV["USER"]
end

include_recipe "asdf/default.rb"
include_recipe "fish/default.rb"
include_recipe "fish-theme/default.rb"
include_recipe "alacritty/default.rb"

include_recipe "bat/default"
include_recipe "peco/default.rb"
include_recipe "ghq/default.rb"

include_recipe "tmux/default.rb"
