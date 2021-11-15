source ~/.zsh/antigen.zsh
source ~/.zsh/pwplug.sh
DC_CANARY_FLATPAK_DIRECTORY="$HOME/.var/app/com.discordapp.DiscordCanary"
PC_DIRECTORY="$DC_CANARY_FLATPAK_DIRECTORY/.powercord"
fpath=( ~/.zfunc "${fpath[@]}" )
# plugins
	antigen bundle git
	antigen bundle heroku
	antigen bundle pip
	antigen bundle lein
	antigen bundle command-not-found
	antigen bundle zdharma-continuum/fast-syntax-highlighting
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-completions
# endplugins

# configure plugins
	export HISTFILE=$HOME/.zsh/.zhistory

  
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
	fc -p $HISTFILE

	ZSH_AUTOSUGGEST_STRATEGY=(history completion) 
	function mypwd {
		if [[ $(pwd) == $HOME ]]; then
			echo "~"
		else 
			echo "$(basename $(pwd))"
		fi
	}
	
	#eval "$(starship init zsh)"
	cinza="$(tput bold ; tput setaf 0)"
	branco="$(tput bold ; tput setaf 7)"
	azul="$(tput bold; tput setaf 4)"
	ciano="$(tput bold; tput setaf 6)"
	vermelho="$(tput bold; tput setaf 1)"
#	export PS1="${azul}[${ciano} $(whoami) ${branco}%1d ${azul}]${branco}$ " 
	eval "$(starship init zsh)"
	export PATH="$PATH:$HOME/.emacs.d/bin"
# endconfigure plugins


# load plugins
antigen apply
. "$HOME/.cargo/env"
export MIRIFLAGS="-Zmiri-ignore-leaks -Zmiri-disable-isolation"

# utils
#frep - frep 's/a/b/g' a.txt
function frep() {
	sed $1 $2 > /tmp/FREPFILE
	cp $2       /tmp/$2.backup
	rm $2
	cp /tmp/FREPFILE $2
}
export DENO_INSTALL="/home/yxqsnz/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
function cbuild {
	EXECUTABLE=$(mktemp --suffix=.exe)
	if clang $@ -o $EXECUTABLE; then
		$EXECUTABLE
	fi

}
# function powercord {
	# if [[ "$1" == 'in' || "$1" == 'add' ]]; then
		# pushd $PC_DIRECTORY >/dev/null
			# pushd $PC_DIRECTORY/src/Powercord/plugins >/dev/null
				# echo "Installing Plugins: "
								# 
				# for repo in $@; do
					# if [[ $repo == 'in' ]]; then
						# continue
					# fi
					# printf "    \e[34m$repo... \e[0m"
					# GIT=$(git clone $repo 2>/dev/null)
					# echo "\e[32mok.\e[0m"
				# done
			# popd >/dev/null
		# popd >/dev/null
	# fi
	# if [[ "$1" == 'tin' || "$1" == 'add-theme' ]]; then
			# pushd $PC_DIRECTORY >/dev/null
				# pushd $PC_DIRECTORY/src/Powercord/themes >/dev/null
					# echo "Installing themes: "
									# 
					# for repo in $@; do
						# if [[ $repo == 'tin' ]]; then
							# continue
						# fi
						# printf "    \e[34m$repo... \e[0m"
						# GIT=$(git clone $repo 2>/dev/null)
						# echo "\e[32mok.\e[0m"
					# done
				# popd >/dev/null
			# popd >/dev/null
	# fi
# }
pc_plug_init $PC_DIRECTORY

pcp https://github.com/Juby210/bdCompat as plug
pcp https://github.com/AAGaming00/better-connections as plug
pcp https://github.com/Juby210/better-folders as plug
pcp https://github.com/doggybootsy/BetterMediaPlayer as plug
pcp https://github.com/griefmodz/better-status-indicators as plug
pcp https://github.com/NurMarvin/better-threads as plug
pcp https://github.com/12944qwerty/copy-server-icon as plug
pcp https://github.com/12944qwerty/css-toggler as plug
pcp https://github.com/KableKo/discord-status as plug
pcp https://github.com/Juby210/game-activity-toggle as plug
pcp https://github.com/BenSegal855/In-app-notifs as plug
pcp https://github.com/Juby210/mention-count as plug
pcp https://github.com/SomeAspy/nekos-dot-life as plug
pcp https://github.com/griefmodz/notey as plug
pcp https://github.com/E-boi/NSFW-tags as plug
pcp https://github.com/griefmodz/online-friends-count as plug
pcp https://github.com/Puyodead1/pc-stafftags as plug
pcp https://github.com/bottom-software-foundation/power-bottom as plug
pcp https://github.com/E-boi/Powercord-BlurNSFW as plug
pcp https://github.com/yuwui/powercord-greentext as plug
pcp https://github.com/Bricklou/powercord-pindms as plug
pcp https://github.com/LandenStephenss/PowercordPluginDownloader as plug
pcp https://github.com/Penguin-Spy/powercord-ppl-moe as plug
pcp https://github.com/SammCheese/powercord-sauce as plug
pcp https://github.com/ploogins/PowercordThemeDownloader as plug
pcp https://github.com/LandenStephenss/PowerFiles as plug
pcp https://github.com/A-Trash-Coder/preview-hider as plug
pcp https://github.com/cyyynthia/pronoundb-powercord as plug
pcp https://github.com/A-Trash-Coder/Quick-Channel-Mute as plug
pcp https://github.com/Rodentman87/reddit-parser as plug
pcp https://github.com/Twizzer/relationship-notifier as plug
pcp https://github.com/12944qwerty/report-messages as plug
pcp https://github.com/ADoesGit/rich-quotes as plug
pcp https://github.com/griefmodz/scrollable-autocomplete as plug
pcp https://github.com/cyyynthia/senkocord as plug
pcp https://github.com/E-boi/ShowConnections as plug
pcp https://github.com/Oocrop/show-sessions as plug
pcp https://github.com/redstonekasi/theme-toggler as plug
pcp https://github.com/justkamiii/token as plug
pcp https://github.com/powercord-community/twemoji-but-good as plug
pcp https://github.com/VenPlugs/Unindent as plug
pcp https://github.com/griefmodz/user-birthdays as plug
pcp https://github.com/dutake/voice-chat-utilities as plug
pcp https://github.com/Vap0r1ze/vpc-shiki as plug
pcp https://github.com/jaimeadf/who-reacted as plug
pcp https://github.com/KryskZ09/zencord as plug


gh completion -s zsh         > ~/.zfunc/_gh
rustup completions zsh       > ~/.zfunc/_rustup
rustup completions zsh cargo > ~/.zfunc/_cargo
autoload -U compinit; compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zsh/.zcompcache"
autoload -Uz compinit
compinit -u
