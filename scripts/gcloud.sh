#! /bin/bash
sudo snap install gcloud-cloud-sdk

# SETUP
gcloud init

# GET APPLICATION DEFAULT FOR RUNNING LOCALLY AND TALKING TO THE CLOUD
gcloud auth application-default login

# CONFIGURE GCLOUD CONTAINER REGISTRY
gcloud auth configure-docker
