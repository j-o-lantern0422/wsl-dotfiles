git "#{ENV['HOME']}/.asdf" do
  repository "git://github.com/asdf-vm/asdf.git"
  user ENV["USER"]
end

directory "#{ENV['HOME']}/.config/fish/completions" do
  action :create
  owner ENV["USER"]
  group ENV["USER"]
end

remote_file "#{ENV['HOME']}/.config/fish/completions/asdf.fish" do
  source "#{ENV['HOME']}/.asdf/completions/asdf.fish"
  mode "644"
  owner ENV["USER"]
  group ENV["USER"]
end
