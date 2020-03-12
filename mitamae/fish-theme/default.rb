execute "install theme" do
  command "fish -c \"fisher add oh-my-fish/theme-bobthefish\""
  not_if "fish -c \"fisher ls theme-bobthefish | grep theme-bobthefish\""
end
