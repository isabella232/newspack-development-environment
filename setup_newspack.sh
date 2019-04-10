#!/bin/bash

# Check if correct location, and warn with continue option
if [ ! -f ./vvv-config.yml -a ! -f ./vvv-custom.yml ]; then
    read -r -p "The config YML files not found in this directory. Are you sure you are in the correct Vagrant instance location and wish to continue? [y/n] " response
    case "$response" in
        [yY]) 
            ;;
        *)
            echo "Exiting. Setup not complete."
            exit;
            ;;
    esac
fi

# Download the provisioning script
mkdir -p config/homebin
curl -0 https://raw.githubusercontent.com/Automattic/newspack-development-environment/master/config/homebin/vagrant_provision_custom > config/homebin/vagrant_provision_custom
chmod ugo+x config/homebin/vagrant_provision_custom

echo "Done!"

