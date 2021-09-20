
# Can manage local plugins
zplug "~/.zsh", from:local

# zplug 'dracula/zsh', as:theme
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

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

