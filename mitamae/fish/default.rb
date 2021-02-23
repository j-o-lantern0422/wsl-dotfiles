
execute "yes | sudo apt-add-repository ppa:fish-shell/release-3 && apt-get update" do
  user "root"
  not_if "grep -R fish-shell /etc/apt/"
end

package "fish"

directory "#{ENV['HOME']}/.config/fish" do
  action :create
  owner ENV["USER"]
  group ENV["USER"]
end

remote_file "#{ENV['HOME']}/.config/fish/config.fish" do
  source "./config/config.fish"
  owner ENV["USER"]
  group ENV["USER"]
end

directory "#{ENV['HOME']}/.config/fish/functions" do
  action :create
  owner ENV["USER"]
  group ENV["USER"]
end

remote_file "#{ENV['HOME']}/.config/fish/functions/peco_select_history.fish" do
  source "./config/functions/peco_select_history.fish"
  owner ENV["USER"]
  group ENV["USER"]
end

# 更新するときはfisher.fishを消してmitamaeを実行する
execute "install fisher" do
  command "curl https://git.io/fisher -sLo ~/.config/fish/functions/fisher.fish && fish -c fisher"
  not_if "fish -c 'fisher --version'"
end
