#!/usr/bin/env bash

WORKING_DIR=$(pwd)

function build_symlinks(){
    cat $1 | while read symlink; do
	    to="${symlink#* }"
	    from="${symlink% *}"
	    if [ -e $to ]; then
		    continue
	    fi
        cd $2
        echo "[-] linking $2$from -> $2$to"
	    ln -sf "$from" "$to"
        cd $WORKING_DIR
    done
}

function build_cookies(){
    src_symlinks=src/cookies/symlinks
    dist_cursors=dist/cookies/cursors/
    if [ -d "$dist_cursors" ]; then
        echo "[-] building cookies theme symlinks"
        build_symlinks $src_symlinks $dist_cursors
        echo "[*] cookies theme symlinks done"
    fi
}

function main(){
    build_cookies
}

main
