PECO_VERSION = "0.5.3"
PECO_FILE = "peco_linux_amd64.tar.gz"

execute "get peco" do
  cwd "/tmp"
  command "wget https://github.com/peco/peco/releases/download/v#{PECO_VERSION}/#{PECO_FILE}"
  not_if "peco --version | grep #{PECO_VERSION}"
end

execute "set peco binary" do
  cwd "/tmp"
  command "tar xvf #{PECO_FILE} && sudo mv ./peco_linux_amd64/peco /usr/local/bin/"
  not_if "peco --version | grep #{PECO_VERSION}"
end
