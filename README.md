# Dotfiles

## Overview

This is my custom configurations for the tools I use on Linux managed by [FBorowiec/ansible](https://www.github.com/FBorowiec/ansible).

While you can download the whole repository and use it, it is not recommended though. Good configurations are personal. Everyone should have his or her unique config file. You are encouraged to copy from this this repo the part you feel useful and add it to your own Nvim config.

See [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) on how to install the latest Neovim, and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

#### Dependencies

All dependencies are managed by [Ansible](https://www.github.com/FBorowiec/ansible).

For Bazel projects you will need to run the `bazel_compilation_db.sh` first. This will let you use the command `bazel-compdb` to generate a `compile_commands.json`.

---

## Zshell

Used with `oh-my-zsh`, `powerlevel10k` and the following plugins:

* `bazel`
* `git`
* `docker`
* `docker-compose`
* `docker-machine`
* `zsh-autosuggestions`
* `zsh-navigation-tools`

---

## Nvim

### Search and replace

How to:
* `<leader>fg` - Telescope grep
* `<C-q>` - Add results to quickfix list
* `:cfdo %s/ORIGINAL/REPLACEMENT/g | update` - replace within the qf-list

Reference: [`nvim_search_replace_multiple_file`](https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/)

* `q:` - list last executed commands
* `copen | lopen` - open quickfix or location list
* `[d / ]d` - next / previous diagnostic

### Trouble shooting Neovim issues

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot.

### Special thanks

Special thanks to [Alexander Born](https://github.com/alexander-born) who helped me with the `lua` and `bazel` setup.
