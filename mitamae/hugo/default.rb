HUGO_VERSION="0.67.0"

if ENV["OS"] == "mac"
  package "hugo"
else
  execute "get hugo" do
    cwd "/tmp"
    command "wget https://github.com/gohugoio/hugo/releases/download/v#{HUGO_VERSION}/hugo_extended_#{HUGO_VERSION}_Linux-64bit.tar.gz"
    not_if "hugo version | grep #{HUGO_VERSION}"
  end

  execute "set hugo binary" do
    cwd "/tmp"
    command "tar xvf hugo_extended_#{HUGO_VERSION}_Linux-64bit.tar.gz && sudo mv ./hugo /usr/local/bin/"
    not_if "hugo version | grep #{HUGO_VERSION}"
  end
end
