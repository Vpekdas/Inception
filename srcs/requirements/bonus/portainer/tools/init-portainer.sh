#!/bin/bash

if [[ ! -f "portainer" ]]; then

echo -n $PORTAINER_PASSWORD > /tmp/portainer_password
/opt/portainer/portainer --admin-password-file /tmp/portainer_password

touch portainer

fi

exec "$@"