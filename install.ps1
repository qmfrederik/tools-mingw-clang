# Set-ExecutionPolicy Bypass -Scope Process -Force;
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# MSYS2, the work environment
choco install -y msys2

# Install Ansible
C:\tools\msys64\usr\bin\bash --login -c 'pacman -S --needed --noconfirm ansible'

# Run the provisioning playbook locally
& 'C:\tools\msys64\usr\bin\bash.exe' --login -c 'ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 /c/vagrant/playbook.yml'
