#!/bin/bash

# Ensure script is called with the right number of arguments
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <target_hosts> <client_name> <check_type>"
    echo "Example: $0 10.0.0.20,10.0.0.40 clientA prechecks"
    exit 1
fi

# Assign arguments to variables
TARGET_HOSTS=$1
CLIENT_NAME=$2
CHECK_TYPE=$3

# Create the local output directory if it doesn't exist
LOCAL_OUTPUT_DIR="/home/aritro/collected_outputs"
mkdir -p "$LOCAL_OUTPUT_DIR"

# Run the Ansible playbook with the provided parameters
ansible-playbook /home/aritro/ansible_aritro/pre_post_checks.yml \
  -e "target_hosts=$TARGET_HOSTS" \
  -e "client_name=$CLIENT_NAME" \
  -e "check_type=$CHECK_TYPE"

