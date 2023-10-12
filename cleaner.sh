#!/bin/bash

#Author      : KHALID BOUYCHOU
#intra login : khbouych

Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')

echo -e "\033[33m\n -- Available Storage Before Cleaning : || $Storage || --\033[0m"
echo -e "-------------------------------------------------------------------"
sleep 1
# Empty the Trash
rm -rf ~/.Trash/*

# Clear caches from Library and Home directories
rm -rf ~/Library/Caches/*
rm -rf ~/Caches/*

# Clear Chrome caches
rm -rf ~/Library/Caches/Google/Chrome/*

# Clear VSCode caches and workspaces cache storage
rm -rf ~/Library/Application\ Support/Code/Cache/*
rm -rf ~/Library/Application\ Support/Code/CachedData/*
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/*

# Clear social media apps caches (e.g., Slack, Discord)
rm -rf ~/Library/Application\ Support/Slack/Cache/*
rm -rf ~/Library/Application\ Support/Slack/Caches/*
rm -rf ~/Library/Caches/com.tinyspeck.slackmacgap/*
rm -rf ~/Library/Application\ Support/discord/Cache/*
rm -rf ~/Library/Application\ Support/discord/Caches/*

# Clear file systems located in browsers profiles directories (e.g., Chrome, Chromium)
rm -rf ~/Library/Application\ Support/Google/Chrome/Default/File\ System/*
rm -rf ~/Library/Application\ Support/Chromium/Default/File\ System/*

#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
sleep 1
echo -e "\033[32m -- Available Storage After Cleaning : || $Storage || --\n\033[0m"
