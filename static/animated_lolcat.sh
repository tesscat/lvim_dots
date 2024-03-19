#!/usr/bin/env bash

# from https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-3815651

# counter=0

# while :
# do
# counter=$((counter+1))
tput clear
tput cup 0 0
lolcat -f -h 0.46 -v 0.2 -r $1
    # sleep .1
# done
