
execute "yes | sudo apt-add-repository ppa:fish-shell/release-3 && apt-get update" do
  user "root"
  not_if "grep -R fish-shell /etc/apt/"
end

package "fish"

directory "#{ENV['HOME']}/.config/fish" do
  action :create
end

remote_file "#{ENV['HOME']}/.config/fish/config.fish" do
  source "./config/config.fish"
end

remote_directory "#{ENV['HOME']}/.config/fish/functions" do
  action :create
  source "config/functions"
end

# 更新するときはfisher.fishを消してmitamaeを実行する
execute "install fisher" do
  command "curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher"
  not_if "test -e ~/.config/fish/functions/fisher.fish"
end

execute "install theme" do
  command "fisher add oh-my-fish/theme-bobthefish"
  not_if "fish -c \"fisher ls theme-bobthefish | grep theme-bobthefish\""
end
