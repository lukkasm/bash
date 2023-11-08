#!/bin/bash

dir="."


if [[ $# == 2 ]]; then
	if [[ "$1" == "-a" && -d "$2" ]]; then
		show_hidden=true
		dir="$2"
	else
		echo "ERROR: INVALID ARGUMENTS"
		exit 1
	fi
elif [[ $# == 1 ]]; then
	if [[ "$1" == "-a" ]]; then
		show_hidden=true
	elif [[ -d "$1" ]]; then
		dir="$1"
	else
		echo "ERROR: SUCH A DIRECTORY NO EXIST!"
		exit 1
	fi
elif [[ $# == 0 ]]; then
	dir="."
else
	echo "ERROR: TOO MANY ARGUMENTS!"
	exit 1
fi

shopt -s dotglob
for item in "${dir}"/*; do
	if [[ "$show_hidden" != true ]] && [[ "$(basename "$item")" == .[^.]* ]]; then
		continue
	fi

	case "$item" in
		-f)
			type="-"
			;;
		-d)
			type="d"
			;;
		-L)
			type="1"
			;;
		*)
			type="n"
			;;
	esac

	perm=""

	check_perm(){
		case "$1" in
			-r)
				[[ -r "$item" ]] && perm+="r" || perm+="-"
				;;
			-w)
				[[ -w "$item" ]] && perm+="w" || perm+="-"
				;;
			-x)
				[[ -x "$item" ]] && perm+="x" || perm+="-"
				;;
		esac
	}

	check_perm -r
	check_perm -w
	check_perm -x

	echo "$(basename "$item") $type $perm"
done

shopt -u dotglob


