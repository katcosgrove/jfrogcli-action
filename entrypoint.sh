#!/bin/sh

set -e

if [ $auth = "username" ]; 
then
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$url --user=$user --password=$pass"
elif [ $auth = "apikey" ];
then
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$url --apikey=$apikey"
elif [ $auth = "accesstoken" ];
then 
    sh -c "jfrog rt config --interactive=false --enc-password=true --url=$url --access-token=$token"
else 
    echo "Error: Authentication mode must be set!"; 
fi

for cmd in "$@"; do
    echo "Running: '$cmd'"
    if sh -c "jfrog rt $cmd"; then
        echo "Success!"
    else
        exit_code=$?
        echo "Failure: '$cmd' exited with $exit_code"
        exit $exit_code
    fi
done