#!/bin/bash

set -e 

# We should be working in home dir of repo
cd "$(dirname "$0")"
workingdir=$(pwd)
if ! [[ "$workingdir" =~ .*techtask-dadjokes-jan$ ]]; then
    echo "not working in dir but we should be. Something has gone wrong"
    exit 1
fi

# Allow people to exit on threat of minikube delete
while true; do

read -p "This will run 'minikube delete' - are you sure? (y/n)" yn

case $yn in 
	[yY] ) echo running;
		break;;
	[nN] ) echo exiting;
		exit;;
	* ) echo invalid response;;
esac

done

minikube delete ; minikube start ; minikube addons enable ingress

kubectl apply -f namespace.yaml

kubectl apply -f dadjokes.yaml

kubectl apply -f metrics-server-components.yaml

# let addon come up
sleep 30

kubectl apply -f autoscaler.yaml

kubectl apply -f ingress.yaml

# will prompt sudo 
minikube tunnel

