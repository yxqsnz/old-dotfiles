function clean() {         
	for _ in $(seq 100)
	do 
		dd if=/dev/zero of="$@" bs=1 count=$(ls -l $@ | awk '{print $5 }') 2>/dev/null
	done
} 
function foxd {
	if ! [[ -f $@ ]] {
		echo 'file is required'
		return 
	}

	clean $@
	shred $@
	clean $@
	shred -u $@
}
function delete-this {
	for file in .
	do
		foxd $f &
	done
}
function delete-with {
	for file in $($@)
	do
		foxd $file &
	done
}
function find-str {
	SEARCH=$(grep -Rn --color=always "$@");
	COUNT=$(echo "$SEARCH" | wc -l);
	if [[ $COUNT -eq 0 ]]
	then
		printf "string not found '$@'.\n"
	else
		printf "Results:\n--------\n\n${SEARCH}\n\n--------\nTotal found: ${COUNT}\n"
	fi
}
function build-all-the-c {
	files=$(find . -type f -name "*.c")
	for file in $(echo $files | xargs -0)
	do
		object="${file}.o"
		echo "Creating C Object: $file -> $object"
		clang -c ${file} -o ${object}
	done
	printf "Linking Executable ... "
	clang *.o $@
	echo "Done."
}
function parse-json {
	 python3 -c "import sys, json; print(json.load(sys.stdin)['$@'])"
}
function use {
	source $@
}
function stringify {
	sed "s/'/\"/g"	
}
function temp {
	RAW_JSON=$(sensors -j -u)
	RESULT=$(echo $RAW_JSON | parse-json "coretemp-isa-0000" | stringify | parse-json "Package id 0" | stringify | parse-json "temp1_input") 
	echo "temp: ${RESULT}"
}
function __neovide {
	~/.cargo/target/release/neovide --nofork $@	
}
function neovide {
	__neovide $@ 2>/dev/null;
	while [[ $? != 0 ]]
	do
		__neovide $@;
	done
}
function RustUpdate {
	echo 'RustUpdater >>= Updating Rust... '
	rustup update
	echo 'RustUpdater >>= Cleaning SCCACHE... '
	rm -rf ~/.cache/sccache
	echo 'RustUpdater >>= Cleaning Cargo... '
	cargo clean 
}
function paste() {
              local file=${1:-/dev/stdin}
              curl --data-binary @${file} https://paste.rs
          }
  
function my-history-is {
	ZSH_HISTORY="$HOME/.zsh/history.unknown"
	FOUND_COUNT=$(grep "$@" $ZSH_HISTORY | wc -l)
	HISTORY_LEN=$(cat $ZSH_HISTORY | wc -l) 
	echo "$(((${FOUND_COUNT}*100)/${HISTORY_LEN}))% ($FOUND_COUNT/$HISTORY_LEN) of my history is '$@'"
}
function packer {
	case "$1" in
		'sync') nvim +PackerSync;;
		*) echo 'unknown action';;
	esac
}
function make {
	if test -f 'Cargo.toml'
	then
		cargo run -q $@
	fi
}
