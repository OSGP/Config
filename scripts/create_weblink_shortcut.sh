#!/bin/sh

target_path=/home/dev/Desktop

target_file=$1'.desktop'
name=$2
url=$3

echo "##  Creating shortcut for weblink to "$2

echo '[Desktop Entry]' 		>> $target_path/$target_file
echo 'Type=Application' 		>> $target_path/$target_file
echo 'Terminal=false'	>> $target_path/$target_file
echo 'Icon=/usr/share/icons/unity-icon-theme/apps/128/web.svg' 		>> $target_path/$target_file 
echo 'Name='$name 		>> $target_path/$target_file
echo 'Exec=firefox '$url	>> $target_path/$target_file
echo 'Categories=Utility;' 	>> $target_path/$target_file

chmod u+rwx $target_path/$target_file
