#!/bin/bash
# COMMIT_ID : Code -> About VSCode -> Commit

COMMIT_ID=$1

wget https://update.code.visualstudio.com/commit:$COMMIT_ID/server-linux-x64/stable -O vscode-server.tar.gz

tar xvf vscode-server.tar.gz

mv vscode-server-linux-x64 vscode-server

cp -r vscode-server/* ~/.vscode-server/bin/$COMMIT_ID/
touch ~/.vscode-server/bin/$COMMIT_ID/vscode-scp-done.flag

# clean
rm -rf vscode-server
rm -rf vscode-server.tar.gz

