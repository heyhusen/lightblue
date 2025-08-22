# Lightblue

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/heyhusen/lightblue/build.yml?style=flat-square&label=CI) ![GitHub License](https://img.shields.io/github/license/heyhusen/lightblue?style=flat-square)

![Screenshot](./screenshot.png)

## Why?

During my daily Linux experience, Fedora has been my longest-standing distro. I
love using it because it's so easy to use. It wasn't until I updated my Fedora
Workstation to version 42 that I ran into my first problem. There were
dependency issues with some packages I'd previously installed. The solution was
simple, but I didn't want to repeat the same process.

I already knew Fedora Atomic existed. But I always thought immutability wasn't
for me. Then, I discovered [BlueBuild](https://blue-build.org/). Finally, I
could build my own immutability system to my liking. So, I made this.

> This image is based on
[unofficial image](https://gitlab.com/fedora/ostree/ci-test) for Fedora bootable
container. Use at your own risk.

## Features

This is essentially just a vanilla version of Fedora Silverblue. I didn't change
the theme or wallpaper. However, I did make a few changes:

- Remove unnecessary repositories, software and gnome extension
- Disable layering (with `rpm-ostree`)
- Enable hardware video acceleration (with VAAPI)
- Install `helix` as main text editor, also `zed` and `vscode` for the rest
- Install `mise` for manage per project tools
- Install `docker` and `compose` for devcontainer
- Keep `firefox` as main browser, and add `chromium` for web development
- Install Noto Sans and JetBrains Mono Nerd Font
- Apply Tokyo Night theme to every app (if it possible)
- Set up my [dotfiles](https://github.com/heyhusen/dotfiles) automatically

## Installation

This image is based on Fedora Silverblue 42. So, make sure you already had that
version installed.

This repo will build images daily. So, if you want to update your system, simply
change the image tag to any available tag on [packages](https://github.com/heyhusen?tab=packages&repo_name=lightblue).

1.  First rebase to the unsigned image, to get the proper signing keys and
policies installed:

  ```sh
  sudo bootc switch --apply ghcr.io/heyhusen/lightblue:42
  ```
2. Then rebase to the signed image, like so:

  ```sh
  sudo bootc switch --enforce-container-sigpolicy --apply ghcr.io/heyhusen/lightblue:42
  ```
> After every each step above, your device will restart.

### Post Install (Optional)

This step is optional, but mandatory for me. You only need to run it once.

#### Set fish as default shell

```sh
sudo usermod --shell /usr/bin/fish $USER
```

#### Allow docker to run without sudo

```sh
sudo usermod -aG docker $USER
```

> After that, restart your device.

## Verification

This image is signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by
downloading the `cosign.pub` file from this repo and running the following
command:

```sh
cosign verify --key cosign.pub ghcr.io/heyhusenn/Lightblue
```
