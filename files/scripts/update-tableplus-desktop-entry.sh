#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

sed -i 's|^Exec=/usr/local/bin/tableplus|Exec=/opt/tableplus/tableplus|' /opt/tableplus/tableplus.desktop
