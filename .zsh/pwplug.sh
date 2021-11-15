#/bin/bash
PC_PLUG_VERSION="0.0.1"
unset PC_PLUGS
PLUG_PATH="$PC_PATH/src/Powercord/plugins"
function pc_plug_init() {
    if test -d "$1"; then
        export PC_PATH="$1"
    else
        echo "PCPLUG: '$1' Must be a valid directory."
    fi
}
function powercord {
    if [[ "$1" == "" ]]; then
        echo "PCPLUG: v${PC_PLUG_VERSION}"
        echo "Usage: "
        echo "  in : Install Plugins"
        echo "  rm : Remove Plugins"
        echo "  up : Update Plugins"
        echo "  ls : List Plugins"
        echo "  fn : clean downloaded plugins"
        return
    fi
    case $1 in
        'in') _pcp_in $@ ;;
        'fn') _pcp_cl ;;
    esac
}
function pcp {
    if [[ "$1" == '' ]] || [[ "$2" != "as" ]] || [[ "$3" == '' ]]; then
        echo 'pcp: invalid syntax.'
        return
    fi
    if [[ "$3" == 'theme' ]] ; then
        export THEMES="$1 ${THEMES}"
        return
    fi
    export PC_PLUGS="$1 ${PC_PLUGS}"
}
function _pcp_cl {
  echo "Removing $(echo $PC_PLUGS | wc -w) Plugins..."
  eval "declare -a pc_plugs=(${PC_PLUGS})"
  pushd $PLUG_PATH >/dev/null
  for plug in "${pc_plugs[@]}"; do
      PLUG=$(basename $plug)
      printf "    \e[34m$PLUG... \e[0m"
      rm -rf $PLUG
      echo "\e[32mok.\e[0m"
  done
  popd > /dev/null
}
function _pcp_in {
    for plug in $@; do
        if [[ $plug == 'in' ]]; then
            continue
        fi
        pcp $@
    done
    if [[ "$PC_PLUGS" == '' ]]; then
        return
    fi
    echo "Installing $(echo $PC_PLUGS | wc -w) Plugins..."
    eval "declare -a pc_plugs=(${PC_PLUGS})"
    for plug in "${pc_plugs[@]}"; do
        printf "    \e[34m$plug... \e[0m"
        pushd $PLUG_PATH > /dev/null
            if test -d $(basename $plug); then
                echo "\e[32mok.\e[0m (exists)"
                continue
            fi
            PC_PLUG_COMMAND="git clone $plug -q"
            eval $PC_PLUG_COMMAND
            if [[ $? != 0 ]]; then
                echo "\e[31merr.\e[0m"
                return
            fi
            echo "\e[32mok.\e[0m"
        popd >/dev/null
    done
}
function pplugfreeze {
    pushd $PLUG_PATH
    for f in $(ls $PLUG_PATH); do
        pushd $f >/dev/null
        R=$(git remote get-url origin)
        if [[ "$R" != "https://github.com/powercord-org/powercord" ]]; then
            echo pcp $R as plug
        fi
        popd >/dev/null
    done
    popd
}
