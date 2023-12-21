#!/bin/sh
echo -ne '\033c\033]0;2Caras1Moto\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/2Caras1Moto.x86_64" "$@"
