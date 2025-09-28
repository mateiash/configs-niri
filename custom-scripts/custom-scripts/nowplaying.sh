#!/bin/bash
title=$(playerctl metadata --format "{{ title }}")
artist=$(playerctl metadata --format "{{ artist }}")
album=$(playerctl metadata --format "{{ album }}")
art=$(playerctl metadata --format "{{ mpris:artUrl }}")

position=$(playerctl position --format "{{ duration(position) }}")
length=$(playerctl metadata --format "{{ duration(mpris:length) }}")

positionmilis=$(playerctl position --format "{{ position }}")
lengthmilis=$(playerctl metadata --format "{{ mpris:length }}")

#ratio=$(echo "scale=2 ; 100 * $positionmilis / $lengthmilis" | bc)
ratio=$((100 * $positionmilis / $lengthmilis))
echo $ratio

art_temp_path="/tmp/nowplaying_art"

wget -q "$art" -O "$art_temp_path"

notify-send -h int:value:$ratio --urgency="low" -i "$art_temp_path" "$title" "by $artist on $album\n$position / $length"

rm $art_temp_path
