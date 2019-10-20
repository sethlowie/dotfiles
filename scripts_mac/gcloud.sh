#! /bin/bash
cd /tmp

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-242.0.0-linux-x86_64.tar.gz

tar zxvf google-cloud-sdk-242.0.0-linux-x86_64.tar.gz -C $HOME

$HOME/google-cloud-sdk/install.sh

# SETUP
~/google-cloud-sdk/bin/gcloud init

# GET APPLICATION DEFAULT FOR RUNNING LOCALLY AND TALKING TO THE CLOUD
~/google-cloud-sdk/bin/gcloud auth application-default login

# CONFIGURE GCLOUD CONTAINER REGISTRY
~/google-cloud-sdk/bin/gcloud auth configure-docker
