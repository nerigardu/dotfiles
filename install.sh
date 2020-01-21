#!/bin/sh

TMP_FILE="$(mktemp)"

files_in_folder() {
	folder=$1
	find "$folder" -maxdepth 1 -not -type d -not -name "install.sh" >> "$TMP_FILE"
}

folders_in_folder() {
	folder=$1
	find "$folder" -maxdepth 1 -type d -not \( -name ".config" -o -name "." -o -name ".git" \) >> "$TMP_FILE"
}

link_dots() {
	while IFS= read -r file ; do
		base="${file#./}"
		link "$(pwd)/$base" "$HOME/$base"
	done < "$TMP_FILE"
}

link() {
	src=$1
	dest=$2
	if [ -d "$dest" ] || [ -f "$dest" ] ; then
		printf "%s already exists\n" "$dest"
	else
		printf "%s -> %s\n" "$src" "$dest"
		ln -s "$src" "$dest"
	fi
}

# populate $TMP_FILE with links to make
files_in_folder .
folders_in_folder .
files_in_folder .config
folders_in_folder .config

# make links unless file already exists
link_dots
