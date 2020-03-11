git "~/.anyenv" do
  repository "https://github.com/riywo/anyenv"
end

execute "anyenv init" do
  command "anyenv install --init"
  not_if "test -d ~/.config/anyenv/anyenv-install"
end

execute "install rbenv" do
  command "anyenv install rbenv"
  not_if "rbenv --version"
end

execute "install nodenv" do
  command "anyenv install nodenv"
  not_if "nodenv --version"
end
