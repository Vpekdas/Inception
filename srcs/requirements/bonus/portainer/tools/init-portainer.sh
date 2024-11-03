#!/bin/bash

if [[ ! -f "portainer" ]]; then

# Add password to a temporary file.
echo -n $PORTAINER_PASSWORD > /tmp/portainer_password

# Use Portainer CLI to set the admin password.
/opt/portainer/portainer --admin-password-file /tmp/portainer_password

# Create a file to indicate that Portainer has been configured.
touch portainer

fi

exec "$@"