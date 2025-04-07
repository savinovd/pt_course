#!/bin/bash

if [ "$1" == "local" ]; then
    INVENTORY_FILE="inventories/local/hosts"
    echo "Installing tools locally"
elif [ "$1" == "ec2" ]; then
    INVENTORY_FILE="inventories/ec2/hosts"
    echo "Installing tools on ec2 instance"
else
    echo "Specify 'local' or 'ec2'"
    exit 1
fi

ansible-playbook -i $INVENTORY_FILE playbooks/playbook.yml