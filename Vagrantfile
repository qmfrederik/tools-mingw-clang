Vagrant.configure("2") do |config|
  config.vm.box = "gusztavvargadr/windows-11"

  config.vm.provider "virtualbox" do |v|
    v.memory = 8192
    v.cpus = 4
    v.name = "tools-mingw-clang"
  end

  config.vm.provision "shell", path: "install.ps1"
end
