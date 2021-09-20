setopt appendhistory autocd beep extendedglob nomatch notify
setopt HIST_IGNORE_SPACE
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
HISTSIZE=100000000
SAVEHIST=100000000
fc -p ~/.zsh/history.unknown

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
