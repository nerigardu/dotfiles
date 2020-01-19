#!/bin/sh
link_file_in_folder() {
	folder=$1
	for file in $(find "$folder" -maxdepth 1 -not -type d -not -name "install.sh") ; do
		base="${file#./}"
		link "$HOME/$base" "$(pwd)/$base"
	done
}

link_folder_in_folder() {
	folder=$1
	for subfolder in $(find "$folder" -maxdepth 1 -type d -not \( -name ".config" -o -name "." -o -name ".git" \) ) ; do
		base="${subfolder#./}"
		link "$HOME/$base" "$(pwd)/$base"
	done
}

link() {
	src=$1
	dest=$2
	if [ -d "$dest" ] || [ -f "$dest" ] ; then
		echo "$dest" already exists
	else
		echo "$src" -\> "$dest"
		ln -s "$src" "$dest"
	fi
}

link_file_in_folder .
link_folder_in_folder .
link_file_in_folder .config
link_folder_in_folder .config
