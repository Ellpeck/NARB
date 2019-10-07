#!/bin/bash
set -e

# Copy assets
mkdir -p bin/obj
cp -r assets bin/obj 

# Run the build command
haxe build.hxml

# Copy the mod to the mods folder
mkdir -p rockbottom/mods
cp bin/bin.jar rockbottom/mods

# Run the game
java -jar lib/RockBottom.jar