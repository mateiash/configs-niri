#!/bin/bash
title=$(playerctl metadata --format "{{ title }}")
artist=$(playerctl metadata --format "{{ artist }}")
album=$(playerctl metadata --format "{{ album }}")
art=$(playerctl metadata --format "{{ mpris:artUrl }}")

position=$(playerctl position --format "{{ duration(position) }}")
length=$(playerctl metadata --format "{{ duration(mpris:length) }}")

art_temp_path="/tmp/nowplaying_art"

wget -q "$art" -O "$art_temp_path"

notify-send --icon="$art_temp_path" "$title" "by $artist on $album\n$position / $length"

rm $art_temp_path
