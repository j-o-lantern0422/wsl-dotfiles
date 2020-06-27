git "#{ENV['HOME']}/.anyenv" do
  repository "https://github.com/riywo/anyenv"
end

execute "anyenv init" do
  command "fish -c 'anyenv install --init'"
  not_if "test -d #{ENV['HOME']}/.config/anyenv/anyenv-install"
end
