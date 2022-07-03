Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
choco install -y git
choco install -y nvm
choco install mongodb
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
nvm install 16.13.1
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
nvm use 16.13.1
 
git clone https://github.com/H1emu/h1z1-server
cd h1z1-server
nvm install
 
NewItem ZoneServerArrcy.ps1
Add-Content ZoneServerArrcy.ps1 '$env:DEBUG="ZoneServer"'
Add-Content ZoneServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Add-Content ZoneServerArrcy.ps1 'echo LOGINSERVER if you want to use h1emu community list'
Add-Content ZoneServerArrcy.ps1 '$env:WORLD_ID="2"'
Add-Content ZoneServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Add-Content ZoneServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Add-Content ZoneServerArrcy.ps1 'node out/servers/LoginServer/zoneserver.js'
 
New-Item LoginServerArrcy.ps1
Add-Content LoginServerArrcy.ps1 '$env:DEBUG="*"'
Add-Content LoginServerArrcy.ps1 '$env:CLIENT_SIXTEEN="true"'
Add-Content LoginServerArrcy.ps1 'echo LOGINSERVER if you want to use h1emu community list'
Add-Content LoginServerArrcy.ps1 '$env:WORLD_ID="2"'
Add-Content LoginServerArrcy.ps1 '$env:LOGINSERVER_IP="127.0.0.1"'
Add-Content LoginServerArrcy.ps1 '$env:MONGO_URL="mongodb://localhost:27017/"'
Add-Content LoginServerArrcy.ps1 'node out/servers/LoginServer/loginserver.js'
 
 
start powershell {./LoginServerArrcy.ps1; exit}
start powershell {./ZoneServerArrcy.ps1; Read-Host}
