#!/usr/bin/env bash
#
# AUR buildscript update checker
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# 2022-12-20
# @linux-aarhus (c) root.nix.dk
# 2023-05-09: added not on yay bugs

# due to a fair amount of open bugs for yay https://github.com/Jguer/yay/issues
# it may be due dilligence to change to paru
# paru supports the same arguments as yay
# simply change yay to paru in the script

AurHelper="yay"

#check if yay is available
if ! command -v ${AurHelper} > /dev/null; then
    echo ":: ${AurHelper} not found... please install"
    exit 1
fi

#check if libnotify is available
if ! [[ "$(which notify-send)" =~ (notify-send) ]]; then
	echo ":: libnotify not found... (sudo pacman -S libnotify"
	exit 1
fi

aur_changed=$(${AurHelper} -Quaq)

if ! [[ -z ${aur_changed} ]]; then
    if ! stty &>/dev/null; then
        notify-send -u normal "Notification of AUR changes"  "$aur_changed"
        exit
    fi
    printf "${aur_changed}"
fi
