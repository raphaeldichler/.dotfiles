#!/usr/bin/env bash

sudo apt-get install ninja-build

cd /usr/local/src
sudo rm -rf lua-language-server
sudo git clone https://github.com/LuaLS/lua-language-server.git
cd lua-language-server
sudo ./make.sh
sudo chmod 0777 -R . 

cat <<EOL | sudo tee /usr/local/bin/lua-language-server > /dev/null
#!/bin/bash
exec "/usr/local/src/lua-language-server/bin/lua-language-server" "\$@"
EOL

sudo chmod +x /usr/local/bin/lua-language-server
sudo chown 0777 /usr/local/bin/lua-language-server
