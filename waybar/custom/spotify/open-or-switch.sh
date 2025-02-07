#!/bin/bash


status=$(playerctl -p spotify status)

if [[ -z $status ]] 
then
    hyprctl dispatch workspace 1 && spotify-launcher
    exit
fi

if [[ $status == "Playing" ]] || [[ $status == "Paused" ]]
then
   hyprctl dispatch workspace 1
   exit
fi