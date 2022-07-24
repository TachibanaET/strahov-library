#!/bin/sh

touch .env

echo "PROXY=$1" >> .env

echo "UID=$(id -u $USER)" >> .env
echo "GID=$(id -g $USER)" >> .env
echo "UNAME=$USER" >> .env
echo "OSTYPE=$(uname)" >> .env