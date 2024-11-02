#!/bin/bash


# TODO: Use env.
if [[ ! -f "portainer" ]]; then

echo -n qwertyuiop12345 > /tmp/portainer_password
/opt/portainer/portainer --admin-password-file /tmp/portainer_password

touch portainer

fi

exec "$@"