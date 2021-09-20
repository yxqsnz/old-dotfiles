for file in ~/.scripts/*
do
	if [[ "${file}" != '/home/yxqsnz/.scripts/autoload.zsh' ]]
	then
		printf "Loading $file ... "
		source "${file}"
		printf "Ok.\n"
	fi
done
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

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
change-cursor 1
zplug load 
alias gcam=git commit -am
eval "$(starship init zsh)"
