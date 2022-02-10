if `uname -a`.include?("Darwin")
  directory "#{ENV['HOME']}/.config/alacritty" do
    action :create
    owner ENV["USER"]
    group ENV["GROUP"]
  end

  remote_file "#{ENV['HOME']}/.config/alacritty/alacritty.yml" do
    source "./config/mac/alacritty.yml"
    owner ENV["USER"]
    group ENV["GROUP"]
  end

  remote_file "#{ENV['HOME']}/.config/alacritty/dracula.yml" do
    source "./config/mac/dracula.yml"
    owner ENV["USER"]
    group ENV["GROUP"]
  end
end
