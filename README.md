# Dotfiles

## Overview

This is my custom configurations for the tools I use on Linux. `init.vim` is the config file for terminal Neovim, and Terminator is the terminal I use instead of the native ubuntu terminal.
`zsh` contains the configuration files for the `zshell`.

While you can download the whole repository and use it, it is not recommended though. Good configurations are personal. Everyone should have his or her unique config file. You are encouraged to copy from this this repo the part you feel useful and add it to your own Nvim config.

See [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) on how to install Neovim, and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

## Features and plugins for Neovim

* `commentary.vim` - Comment stuff out.
* `floaterm` - Use (neo)vim terminal in the floating/popup window.
* `goyo` - Distraction-free writing in Vim.
* `gruvboxmaterial` - Gruvbox Material is a modified version of Gruvbox, the contrast is adjusted to be softer in order to protect developers' eyes.
* `nerdtree` - The NERDTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
* `onedark` - A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals, based on FlatColor, with colors inspired by the excellent One Dark syntax theme for the Atom text editor.
* `quickscope` - An always-on highlight for a unique character in every word on a line to help you use f, F and family. This plugin should help you get to any word on a line in two or three keystrokes with Vim's built-in f`char` (which moves your cursor to `char`).
* `signify` - A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed. You can also preview, stage, and undo individual hunks; and stage partial hunks. The plugin also provides a hunk text object.
* `telescope` - Telescope is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization.
* `undotree` - The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches.
* `vim-airline` - Lean & mean status/tabline for vim that's light as air.
* `vim-bazel` - Vim-bazel is a plugin for invoking bazel and interacting with bazel artifacts.
* `vim-easymotion` - EasyMotion provides a much simpler way to use some motions in vim. It takes the `number` out of `number`w or `number`f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target. When one of the available motions is triggered, all visible text preceding or following the cursor is faded, and motion targets are highlighted.
* `vim-eunuch` - Vim sugar for the UNIX shell commands that need it the most.
* `vim-fugitive` - Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive.
* `vim-highlightedyank` - Make the yanked region apparent.
* `vim-multiple-cursors` - Plugin bringing a much-loved Sublime feature to Vim, doing exactly what it says in the name. You’ve got to love multiple selections.
* `vim-rooter` - Rooter changes the working directory to the project root when you open a file or directory.
* `vim-surround` - Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

---
## Shortcuts

Some of the shortcuts I use frequently. In the following shortcuts, `<leader>` represents ASCII character `,`.

| Shortcut          | Mode          | Description                                                      |
| ----------------- | ------------- | ---------------------------------------------------------------- |
| `<leader>ff`      | Normal        | Fuzzy file search in a floating window                           |
| `<leader>h`       | Normal        | Fuzzy help search in a floating window                           |
| `<leader>t`       | Normal        | Fuzzy buffer tag search in a floating window                     |
| `<leader><Space>` | Normal        | Remove trailing white spaces                                     |
| `<leader>v`       | Normal        | Reselect last pasted text                                        |
| `<leader>ev`      | Normal        | Edit Neovim config in a new tabpage                              |
| `<leader>sv`      | Normal        | Reload Neovim config                                             |
| `<leader>q`       | Normal        | Quit current window                                              |
| `<leader>Q`       | Normal        | Quit all window and close Neovim                                 |
| `<leader>w`       | Normal        | Save current buffer content                                      |
| `<leader>cd`      | Normal        | Change current directory to where current file is                |
| `<leader>y`       | Normal        | Copy the content of entire buffer to default register            |
| `<leader>cl`      | Normal        | Toggle cursor column                                             |
| `<leader>cd`      | Normal        | Change current working directory to to the dir of current buffer |
| `<space>t`        | Normal        | Toggle tag window (show project tags in the right window)        |
| `<F11>`           | Normal        | Toggle spell checking                                            |
| `<F12>`           | Normal        | Toggle paste mode                                                |
| `\x`              | Normal        | Close location or quickfix window                                |
| `\d`              | Normal        | Close current buffer and go to previous buffer                   |
| `{count}gb`       | Normal        | Go to {count} buffer or next buffer in the buffer list.          |
| `Alt-M`           | Normal        | Render Markdown to HTML and open it in system browser            |
| `ob`              | Normal/Visual | Open link under cursor or search visual selection                |
| `ctrl-u`          | Insert        | Turn word under cursor to upper case                             |
| `ctrl-t`          | Insert        | Turn word under cursor to title case                             |
| `jk`              | Insert        | Return to Normal mode (faster `<ESC>`)                           |

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
