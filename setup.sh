#!/bin/bash

git clone https://github.com/raphaeldichler/.dotfiles.git && \
    cd .dotfiles/ && \
    chmod +x install.sh && \
    install.sh && \
    cd ~
