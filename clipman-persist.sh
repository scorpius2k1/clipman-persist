#!/bin/bash
: '
Copyright (C) 2024 scorpius2k1
https://github.com/scorpius2k1/clipman-persist

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
'

if [ "${1}" == "" ]; then
    killall -9 wl-paste 2> /dev/null
    nohup 2> /dev/null | wl-paste --type text --watch $0 start &
    nohup 2> /dev/null | wl-paste --type image --watch $0 start &
    echo "Clipman Persistence Started => $0"
    exit $?
elif [ "${1}" == "start" ]; then
    prev="$(cliphist list | head -1 | awk '{$1=null; print $0}' | xargs --null)"
    cliphist store
    curr="$(cliphist list | head -1 | awk '{$1=null; print $0}' | xargs --null)"
    
    if [[ "${prev}" != "${curr}" && $curr != *"<img "* && $curr != *"file:///"* ]]; then
        cliphist list | head -1 | cliphist decode | wl-copy
    fi
fi
