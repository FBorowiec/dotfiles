# Dotfiles

## Overview

This is my custom configurations for the tools I use on Linux. `init.vim` is the config file for terminal Neovim, and Terminator is the terminal I use instead of the native ubuntu terminal.
`zsh` contains the configuration files for the `zshell`.

While you can download the whole repository and use it, it is not recommended though. Good configurations are personal. Everyone should have his or her unique config file. You are encouraged to copy from this this repo the part you feel useful and add it to your own Nvim config.

See [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) on how to install Neovim 0.5, and how to configure on different platforms (Linux, macOS and Windows).
Under `nvim` you can find the config files for the plugins I use.

---

## Features and plugins for Neovim

* `vim-airline` - Lean & mean status/tabline for vim that's light as air. Customized with `vim-airline-themes`
* `auto-pair` - Insert or delete brackets, parens, quotes in pair.
* `barbar` - A tabline plugin with re-orderable, auto-sizing, clickable tabs, icons, nice highlighting, sort-by commands and a magic jump-to-buffer mode.
* `vim-bazel` - Vim-bazel is a plugin for invoking bazel and interacting with bazel artifacts.
* `bazel-compilation-database` - If you use Bazel and want to use libclang based editors and tools, you can now generate JSON compilation database easily without using build intercept hooks. The advantage is that you can generate the database even if your source code does not compile, and the generation process is much faster.
* `coc` - Coc is an intellisense engine for VIM.
* `vim-commentary` - Comment stuff out.
* `vim-devicons` - Icons inside Vim
* `diffview.nvim` - Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
* `vim-easymotion` - EasyMotion provides a much simpler way to use some motions in vim. It takes the `number` out of `number`w or `number`f{char} by highlighting all possible choices and allowing you to press one key to jump directly to the target. When one of the available motions is triggered, all visible text preceding or following the cursor is faded, and motion targets are highlighted.
* `vim-eunuch` - Vim sugar for the UNIX shell commands that need it the most.
* `far` - Far.vim makes it easier to find and replace text through multiple files. It's inspired by fancy IDEs, like IntelliJ and Eclipse, that provide cozy tools for such tasks.
* `vim-fetch` - Make Vim handle line and column numbers in file names with a minimum of fuss.
* `floaterm` - Use (neo)vim terminal in the floating/popup window.
* `vim-fugitive` - Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive.
* `goyo` - Distraction-free writing in Vim.
* `gruvboxmaterial` - Gruvbox Material is a modified version of Gruvbox, the contrast is adjusted to be softer in order to protect developers' eyes.
* `vim-gutentags` - Gutentags is a plugin that takes care of the much needed management of tags files in Vim. It will (re)generate tag files as you work while staying completely out of your way. It will even do its best to keep those tag files out of your way too. It has no dependencies and just works.
* `gutentags_plus` - Handles switching between cscope databases automatically before performing a search query.
* `gv` - Git commit browser for Vim.
* `vim-highlightedyank` - Make the yanked region apparent.
* `vim-multiple-cursors` - Plugin bringing a much-loved Sublime feature to Vim, doing exactly what it says in the name. You’ve got to love multiple selections.
* `nvim-tree` - The NvimTree is a file system explorer for the Vim editor. Using this plugin, users can visually browse complex directory hierarchies, quickly open files for reading or editing, and perform basic file system operations.
* `nvim-treesitter` - The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.
* `onedark` - A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals, based on FlatColor, with colors inspired by the excellent One Dark syntax theme for the Atom text editor.
* `quickscope` - An always-on highlight for a unique character in every word on a line to help you use f, F and family. This plugin should help you get to any word on a line in two or three keystrokes with Vim's built-in f`char` (which moves your cursor to `char`).
* `vim-rooter` - Rooter changes the working directory to the project root when you open a file or directory.
* `vim-signify` - A Vim plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed. You can also preview, stage, and undo individual hunks; and stage partial hunks. The plugin also provides a hunk text object.
* `vim-startify` - This plugin provides a start screen for Vim and Neovim.
* `vim-surround` - Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.
* `telescope` - Telescope is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim core. Telescope is centered around modularity, allowing for easy customization. Allows for native `fzf` support with `telescope-fzy-native.nvim`.
* `ultisnips` - UltiSnips is the ultimate solution for snippets in Vim. It has many features, speed being one of them.
* `undotree` - The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches.
* `vim-visual-star-search` - This plugin allows you to select some text using Vim's visual mode, then hit * and # to search for it elsewhere in the file.
* `which-key` - WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.

### Important notes

#### Dependencies

* `neovim 0.5`
* `zsh`
* `fzf`
* `ripgrep`
* `terminator`
* `tmux`
* `ctags`

Install them using the `install_env.sh` script.

1. For `clangd` maker sure to run a `:CocCommand clangd.install`.
The available `coc` extensions can be found under: [github.com/neoclide/coc.nvim/wiki/Using-coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

2. For Bazel projects you will need to run the `install_bazel_compilation_db.sh` script and each time you enter a Bazel project run `bazel-compdb`.
This will generate a `compile_commands.json` file which you should include within your `.gitignore`.

3. For C++ projects you should install `ccls` and create a `.ccls` file inside the root folder of you project with the following content:

```bash
clang++
%h %hpp %cpp -std=c++17
```

Or a `compile_flags.txt`:

```bash
-xc++-header
-std=c++17
```

---

## Shortcuts

Some of the shortcuts I use frequently. In the following shortcuts, `<leader>` represents the <\SPACE> bar.

| Shortcut        | Mode          | Description                                                      |
| --------------- | ------------- | ---------------------------------------------------------------- |
| `jk`            | Insert        | Return to Normal mode (faster `<ESC>`)                           |
| `<leader>ff`    | Normal        | Fuzzy file search in a floating window                           |
| `<leader>fg`    | Normal        | Fuzzy string search in a floating window                         |
| `<leader>tt`    | Normal        | Open FloatTerm (floating terminal)                               |
| `<C-^>`         | Normal        | Jump between last two files (remember to press Shift)            |
| `<C-o>`         | Normal        | Jump backwards through history                                   |
| `<C-i>`         | Normal        | Jump forward through history                                     |
| `mh`            | Normal        | Set local mark that you can jump to with 'h (can use any letter) |
| `mH`            | Normal        | Set a global mark that you can jump to with 'H                   |
| `<C-w>o`        | Normal        | Close all but current buffer                                     |
| `<C-w>v`        | Normal        | Split current buffer vertically                                  |
| `<C-w>s`        | Normal        | Split current buffer horizontally                                |
| `:resize 10`    | Normal        | Resize split to 10                                               |
| `<C-w>=`        | Normal        | Equally spread splits                                            |
| `<C-w>r`        | Normal        | Rotate buffer                                                    |
| `<C-w>H`        | Normal        | Switch from horizontal to vertical split                         |
| `<leader>a`     | Normal        | CocList diagnostics                                              |
| `<leader>e`     | Normal        | CocList extensions                                               |
| `<leader>q`     | Normal        | Quit current window                                              |
| `<leader>Q`     | Normal        | Quit all window and close Neovim                                 |
| `<leader>w`     | Normal        | Save current buffer content                                      |
| `<F5>`          | Normal        | UndoTree toggle                                                  |
| `gd`            | Normal        | Go-to definition                                                 |
| `gr`            | Normal        | Go-to references                                                 |
| `<C-]>`         | Normal        | Go-to tag definition                                             |
| `<leader>do`    | Normal        | Open DiffView                                                    |
| `<leader>dc`    | Normal        | Close DiffView                                                   |
| `<C-p>`         | Normal        | Toggle NvimTree                                                  |
| `<leader><C-n>` | Normal        | Multiple cursors selection                                       |

Tip: Have only 3-4 marks with `h` being most important and `l` being least important.

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

1. `install_env.sh`
2. `install_shell.sh`
3. `install_dotfiles.sh`
4. Optional __for Bazel c++ projects__: `install_bazel_compilation_db.sh`
5. Optional: `install_gnome.sh`
