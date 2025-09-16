#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Remove repository so they don't end up enabled on the final image:
echo "Removing unused repositories"
dnf -y copr remove jdxcode/mise
dnf -y copr remove dejan/lazygit
dnf -y copr remove lihaohong/yazi
dnf -y copr remove rivenirvana/lazydocker
dnf -y copr remove sneexy/zen-browser
rm /etc/yum.repos.d/vscode.repo
