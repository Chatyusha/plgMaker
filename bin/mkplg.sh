#!/usr/bin/bash

<< COMMENT_OUT
=================================================
FILE: mkplug.sh
AUTHOR: WisteriaKatyusha <hirounica76@gmail.com>
License: MIT license
=================================================
COMMENT_OUT

PROGRAM=$(basename $0)
VERSION="1.0.0"
PLUGIN_NAME=""
PLUGIN_DIR=""
SCRIPT_NAME=""
BIN_PATH=$(cd $(dirname $0); pwd)
TMP_PATH="$BIN_PATH/tmp"

helppage () {
  echo "Command for making template for Vim's or Neovim's Plugin"
  echo "MKPLUG version: $VERSION"
  echo "Usage: $PROGRAM" [options]
  echo 
  echo "Options"
  echo "  -h, --help"
  echo "  -v, --version"
  echo "  -ex, --example"
  echo "  --name=[plugin name], -n=[plugin name]"
  echo "  --dir=[plugin's directory path], -d=[plugin's directory path] (default path=\$PWD)"
  echo "  --script-name=[script name], -s=[script name] (default name=[plugin name])"
}

setPlugname () {
  arg=$1
  index=$(expr index $1 = )
  PLUGIN_NAME=${arg:$index}
  PLUGIN_NAME=${PLUGIN_NAME//\//:}
}

setPlugDir () {
  arg=$1
  index=$(expr index $1 = )
  PLUGIN_DIR=${arg:$index}
	if [ "${PLUGIN_DIR:0:1}" == "~" ]; then
		PLUGIN_DIR=$(echo $HOME${PLUGIN_DIR:1})
	fi
  if [ "${PLUGIN_DIR: -1}" != "/" ]; then
    PLUGIN_DIR=$(echo $PLUGIN_DIR/ )
	fi
}

setScriptname () {
  arg=$1
  index=$(expr index $1 = )
  SCRIPT_NAME="${arg:$index}"
  SCRIPT_NAME="${SCRIPT_NAME//\//:}" 
  if [ "${SCRIPT_NAME: -3 !=}" != ".vim" ]; then
    SCRIPT_NAME="$SCRIPT_NAME.vim"
  fi
}

Create () {

  if [ -z "$SCRIPT_NAME" ];then
    SCRIPT_NAME="$PLUGIN_NAME.vim"
    SCRIPT_NAME="${SCRIPT_NAME,,}"
  fi
  echo "-------- DIRECTORY_STRUCTURE --------"
  echo "  <$PLUGIN_DIR>"
  echo "      |---- $PLUGIN_NAME"
  echo "        |---- autoload"
  echo "        |  |---- $SCRIPT_NAME"
  echo "        |---- plugin"
  echo "        |  |---- $SCRIPT_NAME"
  echo "        |---- doc"
  echo "        |---- README.md"
  echo "                                    "
  echo "------------------------------------"

  if [ ! -d $PLUGIN_DIR ];then
    echo "$PLUGIN_DIR is node exist"
		exit 1
	fi
	if [ -d $PLUGIN_DIR$PLUGIN_NAME ]; then
		echo "Alady $PLUGIN_DIR$PLUGIN_NAME directory exist"
		exit 1
	fi
	cd $PLUGIN_DIR
	pwd 
	mkdir $PLUGIN_NAME
	cp -r "$TMP_PATH/autoload/" "$PLUGIN_NAME"
	cp -r "$TMP_PATH/plugin/" "$PLUGIN_NAME"
	echo "# $PLUGIN_NAME" >> $PLUGIN_NAME/README.md
	ls -la $PLUGIN_NAME
}

for opt in "$@"
do
  case $opt in
    "-h" | "--help" )
      helppage
      exit 1
      ;;
    "-v" | "--version")
      echo "MkPlug: $VERSION"
      exit 1
      ;;
    "-ex" | "--example" )
      echo "sh mkplg.sh --name=HogePlug --dir=~/plugins --script-name=hoge.vim"

      echo "~/plugins/"
      echo "    |---- HogePlug/"
      echo "      |----autoload/"
      echo "      |  |----hoge.vim"
      echo "      |                "
      echo "      |----plugin/"
      echo "      | |----hoge.vim"
      echo "      |                "
      echo "      |----doc/"
      echo "      |----README.md"
      exit 1
      ;;
    "--name="* | "-n="* )
      setPlugname $opt
      ;;
    "--dir="* | "-d="* )
      setPlugDir $opt
      ;;
    "--script-name="* | "-s="* )
      echo "$opt"
      ;;
    *)
      helppage
      ;;
  esac
done

Create

