BAT_VERSION="0.12.1"

execute "get bat" do
  cwd "/tmp"
  command "wget https://github.com/sharkdp/bat/releases/download/v#{BAT_VERSION}/bat-v#{BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
  not_if "bat --version | grep #{BAT_VERSION}"
end

execute "tar xvf bat-v#{BAT_VERSION}-x86_64-unknown-linux-gnu.tar.gz" do
  cwd "/tmp"
  not_if "bat --version | grep #{BAT_VERSION}"
end

execute "sudo mv ./bat-v#{BAT_VERSION}-x86_64-unknown-linux-gnu/bat /usr/local/bin/" do
  cwd "/tmp"
  not_if "bat --version | grep #{BAT_VERSION}"
end
