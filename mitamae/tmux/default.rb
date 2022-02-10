if `uname -a`.include?("Darwin")
  remote_file "#{ENV['HOME']}/.tmux.conf" do
    source "./config/mac/.tmux.conf"
    owner ENV["USER"]
    group ENV["GROUP"]
  end
end
