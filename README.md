# `dotfiles`

## Overview

This is my custom configurations for the tools I use on Linux managed by [`FBorowiec/ansible`](https://www.github.com/FBorowiec/ansible).

While you can download the whole repository and use it, it is not recommended though.
Good configurations are personal.
Everyone should have his or her unique `config` file.
You are encouraged to copy from this repo the part
you feel useful and add it to your own `Neovim` `config`.

See [`neovim/wiki/Installing-Neovim`](https://github.com/neovim/neovim/wiki/Installing-Neovim)
on how to install the latest `Neovim`,
and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

### Dependencies

All dependencies are managed by [Ansible](https://www.github.com/FBorowiec/ansible).

---

## ZSH z-shell

Used with `oh-my-zsh`, `powerlevel10k` and the following plugins:

- `bazel`
- `git`
- `docker`
- `docker-compose`
- `docker-machine`
- `zsh-autosuggestions`
- `zsh-navigation-tools`
