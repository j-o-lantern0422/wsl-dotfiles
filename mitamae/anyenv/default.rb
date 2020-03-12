git "#{ENV['HOME']}/.anyenv" do
  repository "https://github.com/riywo/anyenv"
end

execute "anyenv init" do
  command "fish -c 'anyenv install --init'"
  not_if "test -d #{ENV['HOME']}/.config/anyenv/anyenv-install"
end

execute "install rbenv" do
  command "anyenv install rbenv"
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/rbenv"
end

execute "install nodenv" do
  command "anyenv install nodenv"
  not_if "test -d #{ENV['HOME']}/.anyenv/envs/nodenv"
end
