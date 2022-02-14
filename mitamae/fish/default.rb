

if `uname -a`.include?("Darwin")
  git "#{ENV['HOME']}/src/github.com/powerline/fonts" do
   repository "https://github.com/powerline/fonts.git"
  end

  execute "install.sh" do
    command "./install.sh"
    cwd "#{ENV['HOME']}/src/github.com/powerline/fonts"
    user "root"
    not_if "ls -1 $HOME/Library/Fonts | grep Powerline"
  end

  git "#{ENV['HOME']}/src/github.com/dracula/fish" do
    repository "https://github.com/dracula/fish.git"
  end

  execute "copy dracula" do
    command "cp #{ENV['HOME']}/src/github.com/dracula/fish/conf.d/dracula.fish #{ENV['HOME']}/.config/fish/conf.d/dracula.fish"
    user ENV["USER"]
  end

  remote_file "#{ENV['HOME']}/.config/fish/functions/brew_path.fish" do
    source "./config/functions/brew_path.fish"
    owner ENV["USER"]
    group ENV["GROUP"]
  end

else
  execute "wget https://github.com/justjanne/powerline-go/releases/download/v1.21.0/powerline-go-linux-amd64 -O /usr/local/bin/powerline" do
    user "root"
    not_if "test -x /usr/local/bin/powerline"
  end
  remote_file "#{ENV['HOME']}/.config/fish/functions/fish_prompt.fish" do
    source "./config/functions/fish_prompt.fish"
    owner ENV["USER"]
    group ENV["GROUP"]
  end
end

unless `uname -a`.include?("Darwin")
  execute "yes | sudo apt-add-repository ppa:fish-shell/release-3 && apt-get update" do
    user "root"
    not_if "grep -R fish-shell /etc/apt/"
  end
end

package "fish"

directory "#{ENV['HOME']}/.config/fish" do
  action :create
  owner ENV["USER"]
  group ENV["GROUP"]
end

remote_file "#{ENV['HOME']}/.config/fish/config.fish" do
  source "./config/config.fish"
  owner ENV["USER"]
  group ENV["GROUP"]
end

directory "#{ENV['HOME']}/.config/fish/functions" do
  action :create
  owner ENV["USER"]
  group ENV["GROUP"]
end

remote_file "#{ENV['HOME']}/.config/fish/functions/peco_select_history.fish" do
  source "./config/functions/peco_select_history.fish"
  owner ENV["USER"]
  group ENV["GROUP"]
end

# 更新するときはfisher.fishを消してmitamaeを実行する
execute "install fisher" do
  command "curl https://git.io/fisher -sLo ~/.config/fish/functions/fisher.fish && fish -c fisher"
  not_if "fish -c 'fisher --version'"
end
