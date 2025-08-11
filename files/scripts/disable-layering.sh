#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Disable rpm-ostree layering
# This is necessary to prevent layering issues in the final image.
# It ensures that the system does not allow additional layers to be added,
# which can lead to inconsistencies or unexpected behavior.
echo "Disable rpm-ostree layering"
sed -i '/^#*LockLayering=.*/s/.*/LockLayering=true/' /etc/rpm-ostreed.conf
