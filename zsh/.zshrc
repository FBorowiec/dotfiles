# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    bazel
    git
    k
    docker
    docker-compose
    fzf-tab
    pip
    thefuck
    ubuntu
    web-search
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-vi-mode
    # zsh-autocomplete # conflicts with zsh-autosuggestions
    zsh-syntax-highlighting # must be last
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

function refresh_tmux_vars {
  if [ -n "$TMUX" ]; then
    eval $(tmux showenv -s | grep -E '^(SSH|DISPLAY)')
  fi
}

function preexec {
    refresh_tmux_vars
}

source ~/.inputrc

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

gencompdb() {
    BAZEL_ROOT=$(bazel info workspace)
    cd ${BAZEL_ROOT} &&
    bazel-compdb &&
    sed -i 's/-fno-canonical-system-headers //g' ${BAZEL_ROOT}/compile_commands.json;
    sed -i 's/-ftree-loop-vectorize //g' ${BAZEL_ROOT}/compile_commands.json;
    perl -ni.bak -e 'print unless /.*\.h(pp)?"},?/' ${BAZEL_ROOT}/compile_commands.json;
    rm ${BAZEL_ROOT}/compile_commands.json.bak 2> /dev/null;
}

# Use neovim in sudo mode
alias svim='sudo -E nvim'
# Reset tmux config
alias tmux_def='rm -r -- ~/.tmux/resurrect/tmux_resurrect_* ~/.tmux/resurrect/last && ln -s ~/.tmux/resurrect/tmux_default.txt ~/.tmux/resurrect/last'
# Move verbose ls
alias k='k -h'
# Permanently alias vim to nvim
alias vim="nvim"
alias vi="nvim"
# Lazygit
alias lg="lazygit"
# Ranger
alias rr="ranger"

alias git-make-worktree="~/.config/worktree.sh"

export PATH="$PATH:/home/$USER/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:/home/sf33267/.local/bin"
export PATH="/home/sf33267/go/bin:$PATH"

bazel() {
    local args=("$@")
    local context_flag=false

    # Iterate through arguments to check for --context
    for arg in "${args[@]}"; do
        if [[ "$arg" == "--errors" ]]; then
            context_flag=true
            # Remove --context from the arguments
            args=("${args[@]/$arg}")
            break
        fi
        if [[ "$arg" == "--iwyu" ]]; then
            context_flag=true
            # Remove --context from the arguments
            args=("${args[@]/$arg}")
            break
        fi
    done


    # Execute the bazel command with or without the context grep
    if $context_flag; then
        if [[ "$arg" == "--errors" ]]; then
            command bazel "${args[@]}" 2>&1 | grep -ie error\: -C1
        fi
        if [[ "$arg" == "--iwyu" ]]; then
            command bazel "${args[@]}" 2>&1 | grep -ie IWYU\: -C5
        fi
    else
        command bazel "${args[@]}"
    fi
}
