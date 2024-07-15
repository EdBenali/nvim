#!/bin/bash

# Install dependancies
sudo apt install npm fd-find ripgrep build-essential libreadline-dev unzip python3-venv -y
sudo apt update

# Install Lua 5.4
if [ ! -d ~/usr/local/lua ]; then
    curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
    tar zxf lua-5.4.7.tar.gz
    cd lua-5.4.7
    make linux test
    sudo make install
    cd ..
    rm lua-5.4.7.tar.gz; rm lua-5.4.7 -r
fi

# Install LuaRocks 3.11.1
if [ ! -f /usr/local/bin/luarocks ]; then
    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
    tar zxpf luarocks-3.11.1.tar.gz
    cd luarocks-3.11.1
    ./configure --with-lua-include=/usr/local/include
    make 
    sudo make install
    cd ..
    rm luarocks-3.11.1.tar.gz; rm luarocks-3.11.1 -r
fi

# Install nvim 0.10.0
if [ ! -d ~/.local/share/nvim ]; then
    curl -L -R -O https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
    tar xzvf nvim-linux64.tar.gz
    ./nvim-linux64/bin/nvim
    rm nvim-linux64.tar.gz; rm nvim-linux64 -r
fi

