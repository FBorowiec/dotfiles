# Dotfiles

## Overview

This is my custom configurations for the tools I use on Linux. `init.vim` is the config file for terminal Neovim, and Terminator is the terminal I use instead of the native ubuntu terminal.
`zsh` contains the configuration files for the `zshell`.

While you can download the whole repository and use it, it is not recommended though. Good configurations are personal. Everyone should have his or her unique config file. You are encouraged to copy from this this repo the part you feel useful and add it to your own Nvim config.

See [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) on how to install Neovim 0.5, and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

#### Dependencies

* `neovim 0.5`
* `zsh`
* `ripgrep`
* `terminator`
* `tmux`
* `ctags`

Install them using the `install_deps.sh` script.

For Bazel projects you will need to run the `install_bazel_compilation_db.sh` script and each time you enter a Bazel project run `bazel-compdb`.
This will generate a `compile_commands.json` file which you should include within your `.gitignore`.

As I use the neovim's native LSP with `clang` for `cpp` projects the error `-fno-canonical-system-headers` pops up as Bazel uses `gcc` for building.
Simply remove it from the `compile_commands.json`:

```bash
sed -i 's/-fno-canonical-system-headers //g' path/to/your/compile_commands.json
```

---

## Trouble shooting

If you come across an issue, you can first use `:checkhealth` command provided by `nvim` to trouble-shoot yourself. Please read carefully the messages provided by health check.

## Zshell

I use it with `oh-my-zsh`, `powerlevel10k` and the following plugins:

* `bazel`
* `git`
* `docker`
* `docker-compose`
* `docker-machine`
* `zsh-autosuggestions`
* `zsh-navigation-tools`

## Install order

`chmod +x *.sh`

1. `install_deps.sh`
2. `install_zshell.sh`
3. `install_neovim.sh`
4. `install_dotfiles.sh`
5. Optional __for Bazel c++ projects__: `install_bazel_compilation_db.sh`
6. Optional: `install_gnome.sh`
7. Optional: `install_polybar.sh`
