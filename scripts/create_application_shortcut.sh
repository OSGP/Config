#!/bin/sh

# SPDX-FileCopyrightText: Contributors to the GXF project
#
# SPDX-License-Identifier: Apache-2.0

target_path=/home/dev/Desktop

target_file=$1'.desktop'
terminal=$2
icon=$3
name=$4
exec=$5

echo "##  Creating shortcut for "$4

echo '[Desktop Entry]' 		>> $target_path/$target_file
echo 'Type=Application' 	>> $target_path/$target_file
echo 'Terminal='$terminal 	>> $target_path/$target_file
echo 'Icon='$icon 		>> $target_path/$target_file 
echo 'Name='$name 		>> $target_path/$target_file
echo 'Exec='$exec		>> $target_path/$target_file
echo 'Categories=Utility;' 	>> $target_path/$target_file

chmod u+rwx $target_path/$target_file
