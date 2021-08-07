source ~/.zplug/init.zsh
source ~/.profile
export ZSH_THEME="spaceship"
setopt appendhistory autocd beep extendedglob nomatch notify
setopt HIST_IGNORE_SPACE
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
source ~/utils.sh
HISTSIZE=100000000
SAVEHIST=100000000
fc -p ~/.zsh_history
# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
# zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
zplug "jhawthorn/fzy", \
    as:command, \
    rename-to:fzy, \
    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    use:get_last_pane_path.sh
zplug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6272a4,bold"

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
zplug "b4b4r07/httpstat", \
    as:command, \
    use:'(*).sh', \
    rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2


# Can manage local plugins
zplug "~/.zsh", from:local

# zplug 'dracula/zsh', as:theme
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
# Then, source plugins and add commands to $PATH
alias "@clone" "git clone";
alias "@add" "git add ";
alias "@push" "git push";
# 0: blinking block
# 1: block
# 2: blinking underline
# 3: undeline
# 4: blinking Beam
# 5: Beam
change-cursor() {
   case $1 in 
     0) echo -e -n "\x1b[\x30 q" ;;
     1) echo -e -n "\x1b[\x32 q" ;;
     2) echo -e -n "\x1b[\x33 q" ;;
     3) echo -e -n "\x1b[\x34 q" ;;
     4) echo -e -n "\x1b[\x35 q" ;;
     5) echo -e -n "\x1b[\x36 q" ;;
     *) echo "$1 is invalid.   " ;;
   esac
}
change-cursor 4
zplug load 
eval "$(starship init zsh)"
export RED_COLOR="\033[0;31m"
export BLUE_COLOR="\033[0;34m"
export BOLD=""
export RESET="\033[0m"
export force_color_prompt=1
# export SUDO_PROMPT="hey ${RED}${USER}${RESET}@${BLUE_COLOR}$(cat /etc/hostname)${RESET} type ya passwd: "
export SUDO_PROMPT="⠀"
function sudo() {
	printf "${RED_COLOR}${USER}${RESET}@${BLUE_COLOR}$(cat /etc/hostname)${RESET} SUDO?\n${BLUE_COLOR}❯${RESET}"
	/usr/bin/sudo $@
}
. $HOME/.asdf/asdf.sh
