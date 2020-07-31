#!/usr/bin/env bash

## Dirs
polybar_path="$HOME/.config/polybar/"
rofi_path="$HOME/.config/rofi/"

## Dark Mode #############################################
if  [[ $1 = "--Dark" ]]; then

# wallpaper ---------------------------------
nitrogen --save --set-zoom-fill $polybar_path/wallpapers/bg_1.jpg

# polybar ---------------------------------
sed -i -e 's/background = .*/background = #00000000/g' $polybar_path/colors
#foreground wifi,bluetooth,dunst, display
sed -i -e 's/background-alt = .*/background-alt = #B38B70/g' $polybar_path/colors
#minutos, sliders
sed -i -e 's/foreground = .*/foreground = #F1D2AE/g' $polybar_path/colors
#background wifi,bluetooth,dunst, display
sed -i -e 's/foreground-alt = .*/foreground-alt = #4a1f1f/g' $polybar_path/colors
#clock, volume_bar
sed -i -e 's/primary = .*/primary = #CF5E49/g' $polybar_path/colors
sed -i -e 's/secondary = .*/secondary = #C47B7C/g' $polybar_path/colors
sed -i -e 's/urgent = .*/urgent = #E6E1CF/g' $polybar_path/colors
sed -i -e 's/bg = .*/bg = #351919/g' $polybar_path/colors
sed -i -e 's/fg = .*/fg = #ecdfd0/g' $polybar_path/colors

# relaunch polybar
polybar-msg cmd restart

# rofi ---------------------------------
sed -i -e 's/background: .*/background:    #1F2430;/g' $rofi_path/colors.rasi
sed -i -e 's/foreground: .*/foreground:    #E6E1CF;/g' $rofi_path/colors.rasi
sed -i -e 's/background-alt: .*/background-alt:    #2f343f;/g' $rofi_path/colors.rasi
sed -i -e 's/text-color: .*/text-color:    #ffffffff;/g' $rofi_path/colors.rasi
sed -i -e 's/primary: .*/primary:    #CBCCC6;/g' $rofi_path/colors.rasi
sed -i -e 's/urgent: .*/urgent:    #E6E1CF;/g' $rofi_path/colors.rasi

## Light Mode #############################################
elif  [[ $1 = "--Light" ]]; then

# wallpaper ---------------------------------
nitrogen --save --set-zoom-fill $polybar_path/wallpapers/BG_2.jpg

# polybar ---------------------------------
sed -i -e 's/background = .*/background = #00000000/g' $polybar_path/colors
sed -i -e 's/background-alt = .*/background-alt = #1F2430/g' $polybar_path/colors
sed -i -e 's/foreground = .*/foreground = #1F2430/g' $polybar_path/colors
sed -i -e 's/foreground-alt = .*/foreground-alt = #B8ABAC/g' $polybar_path/colors
sed -i -e 's/primary = .*/primary = #323432/g' $polybar_path/colors
sed -i -e 's/secondary = .*/secondary = #CBCCC6/g' $polybar_path/colors
sed -i -e 's/urgent = .*/urgent = #E6E1CF/g' $polybar_path/colors
sed -i -e 's/bg = .*/bg = #f6f5f6/g' $polybar_path/colors
sed -i -e 's/fg = .*/fg = #323432/g' $polybar_path/colors

# relaunch polybar
polybar-msg cmd restart

# rofi ---------------------------------
sed -i -e 's/background: .*/background:    #12171bff;/g' $rofi_path/colors.rasi
sed -i -e 's/foreground: .*/foreground:    #b8a5a8ff;/g' $rofi_path/colors.rasi
sed -i -e 's/background-alt: .*/background-alt:    #0b0d0dff;/g' $rofi_path/colors.rasi
sed -i -e 's/text-color: .*/text-color:    #b8a5a8ff;/g' $rofi_path/colors.rasi
sed -i -e 's/primary: .*/primary:    #704955ff;/g' $rofi_path/colors.rasi
sed -i -e 's/urgent: .*/urgent:    #825058ff;/g' $rofi_path/colors.rasi

## Help Menu #############################################
else
echo "
Style Switcher
Developed By - Aditya Shakya (@adi1090x) 
Available options:
--Dark	--Light --Blue
"
fi
