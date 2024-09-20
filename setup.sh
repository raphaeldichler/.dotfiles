#!/bin/bash

git clone git@github.com:raphaeldichler/.dotfiles.git /opt/.dotfiles/ && \
    cd /opt/.dotfiles/ && \
    chmod +x install.sh && \
    install.sh && \
    cd ~
