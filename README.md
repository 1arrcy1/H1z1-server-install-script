<h1 dir="auto">H1z1-server-install-script</h1><p dir="auto">Install h1z1 server with a simple script (tested with ubuntu 20.4)</p><ol><li><code>sudo su</code></li><li><code>apt install git -y</code></li><li><code>git clone https://github.com/1arrcy1/H1z1-server-install-script.git</code></li><li><code>cd H1z1-server-install-script</code></li><li><code>chmod +x install.sh</code></li><li><code>./install.sh</code></li></ol><p dir="auto">"Use sudo su first" Had issue's doing <code>sudo &lt;command&gt;</code> </p><h2>Setup Database settings</h2><p dir="auto">Navigate to <a href="http://ip:4321">http://ip:4321</a> and change <code>ServerAdress</code> to your ip (LAN OR WAN) There are 3 configurations you can use. </p><p dir="auto">The setting can be found under <code><u>h1server &gt; servers</u> - database that contains serverID:2</code> </p><ol><li>locally - Leave the settings the way it is setup. This will only allow connections from the same machine that the server is running. (127.0.0.1)</li><li>Remotely - Change the Ip to your LAN. For example 192.168.178.60 - In this mode you are not able to connect from Outside your LAN ( 192.168.178.*) or connect locally from the same machine that the server is running from.</li><li>H1emu Community - Port forward + Change the Ip to WAN (142.250.179.206) + Ask h1emu admin for ID + Remove LOGINSERVER_IP="127.0.0.1" + change WORLD_ID="{EDIT ME} Settings can be found in \H1z1-server-install-script\h1z1-server\pm2-start-2016-Arrcy.sh</li></ol><p>Use pm2 kill then \H1z1-server-install-script\h1z1-server\pm2-start-2016-Arrcy.sh to restart the server</p><h2>Starting the server</h2><table><tbody><tr><td>Stop server</td><td>pm2 kill</td></tr><tr><td>Start server</td><td>.\H1z1-server-install-script\h1z1-server\pm2-start-2016-Arrcy.sh</td></tr><tr><td>Show server status</td><td>pm2 list</td></tr></tbody></table><h2>Use the torrent if you don't own h1z1 just survive</h2>
