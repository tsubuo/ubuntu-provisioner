# base::default
include_recipe 'apt-repo'

ppa "graphics-drivers/ppa"

%w(
  vim
  nvidia-367      # GeForce Graphics
  mesa-common-dev # GeForce Graphics
  freeglut3-dev   # GeForce Graphics
  solaar          # Logicool Mouse Utility
  solaar-gnome3   # Logicool Mouse Utility
  ruby-bundler
  ruby-dev
).each do |name|
  package name do
    action :install
  end
end

# pyenv
git "/usr/local/pyenv" do
  repository "https://github.com/yyuu/pyenv.git"
  revision   "master"
  action     :sync
end

template "/etc/profile.d/pyenv.sh" do
  source "pyenv.sh.erb"
  action :create
end

bash "install_python" do
  code   "source /etc/profile.d/pyenv.sh && pyenv install anaconda3-4.0.0 && pyenv rehash"
  action :run
end

git "/usr/local/pyenv/plugins/pyenv-virtualenv" do
  repository "git://github.com/yyuu/pyenv-virtualenv.git"
  revision   "master"
  action     :sync
end
