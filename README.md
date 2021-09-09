# Dotfiles

## Overview

This is my custom configurations for the tools I use on Linux. `init.vim` is the config file for terminal Neovim, and Terminator is the terminal I use instead of the native ubuntu terminal.
`zsh` contains the configuration files for the `zshell`.

While you can download the whole repository and use it, it is not recommended though. Good configurations are personal. Everyone should have his or her unique config file. You are encouraged to copy from this this repo the part you feel useful and add it to your own Nvim config.

See [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) on how to install Neovim 0.5, and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

#### Dependencies

* `neovim`
* `zsh`
* `ripgrep`
* `alacritty`
* `tmux`

Install them using the `install_deps.sh` script.

Install order:

1. `install_deps.sh`
2. `install_zshell.sh`
3. `install_neovim.sh`
4. `install_dotfiles.sh`
5. `install_fonts.sh`
6. Optional for Bazel c++ projects: `install_bazel_compilation_db.sh`
7. Optional: `install_gnome.sh`
8. Optional: `install_polybar.sh`


For Bazel projects you will need to run the `install_bazel_compilation_db.sh` first. This will let you use the command `bazel-compdb` to generate a `compile_commands.json`.

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
* `:cfdo s/ORIGINAL/REPLACEMENT/g | update` - replace within the qf-list

Reference: [nvim_search_replace_multiple_file](https://jdhao.github.io/2020/03/14/nvim_search_replace_multiple_file/)

`q:` - list last executed commands
`copen | lopen` - open quickfix or location list

### Trouble shooting Neovim issues

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot.
