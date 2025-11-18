#!/bin/bash
# Extract archive script for yazi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE"
    exit 1
fi

case "$FILE" in
    *.tar.bz2)   tar xjf "$FILE"     ;;
    *.tar.gz)    tar xzf "$FILE"     ;;
    *.tar.xz)    tar xJf "$FILE"     ;;
    *.bz2)       bunzip2 "$FILE"     ;;
    *.gz)        gunzip "$FILE"      ;;
    *.tar)       tar xf "$FILE"      ;;
    *.tbz2)      tar xjf "$FILE"     ;;
    *.tgz)       tar xzf "$FILE"     ;;
    *.zip)       unzip "$FILE"       ;;
    *.Z)         uncompress "$FILE"  ;;
    *.7z)        7z x "$FILE"        ;;
    *.rar)       unrar x "$FILE"     ;;
    *.deb)       ar x "$FILE"        ;;
    *)           echo "Cannot extract '$FILE': unrecognized file extension" ; exit 1 ;;
esac

echo "Extracted: $FILE"
