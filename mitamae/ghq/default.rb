GHQ_VERSION="1.1.0"

if ENV["OS"] == "mac"
  package "ghq"
else
  execute "get ghq" do
    cwd "/tmp"
    command "wget https://github.com/motemen/ghq/releases/download/v#{GHQ_VERSION}/ghq_linux_amd64.zip"
    not_if "ghq --version | grep #{GHQ_VERSION}"
  end

  execute "unzip -o ghq_linux_amd64.zip" do
    cwd "/tmp"
    not_if "ghq --version | grep #{GHQ_VERSION}"
  end

  execute "sudo mv ./ghq_linux_amd64/ghq /usr/local/bin/" do
    cwd "/tmp"
    not_if "ghq --version | grep #{GHQ_VERSION}"
  end
end
