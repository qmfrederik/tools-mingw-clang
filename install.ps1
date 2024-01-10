# Set-ExecutionPolicy Bypass -Scope Process -Force;
# [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# MSYS2, the work environment
choco install -y msys2

# Install Ansible
C:\tools\msys64\usr\bin\bash --login -c 'pacman -S --needed --noconfirm ansible'

# Run the provisioning playbook locally
& 'C:\tools\msys64\usr\bin\bash.exe' --login -c 'ansible-playbook --connection=local --inventory 127.0.0.1, --limit 127.0.0.1 /c/vagrant/playbook.yml'

# Install VS Code so you can work in a Windows shell, using 'vagrant rdp';
# this makes sense for a desktop environment only.
choco install -y vscode

# Configure VS Code to use the MSYS2 terminal by default
New-Item -ItemType Directory -Path ${env:USERPROFILE}\.vscode-server\data\Machine\ -Force
Copy-Item C:\vagrant\settings.json ${env:USERPROFILE}\.vscode-server\data\Machine\settings.json -Force

New-Item -ItemType Directory -Path ${env:USERPROFILE}\AppData\Roaming\Code\User\ -Force
Copy-Item C:\vagrant\settings.json ${env:USERPROFILE}\AppData\Roaming\Code\User\settings.json -Force
