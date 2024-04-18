# clipman-persist
Clipman Persistence For Linux Wayland compositors such as Sway, etc.

Wayland compositors do not offer any sort of clipboard persistence/management by default unless the WM/DE has support built-in (such as KDE). On some Wayland compositors, if you copy text or an image and then close the application from which the data was copied from it will be lost. This simple bash script enables persistence using clipman clipboard manager feature set.

**Dependencies**
* Clipman (https://github.com/luispabon/clipman)

**Installation**
* Simply run this script. A more permanent solution would be to run from your WM/DE autostart configuration, add to your ``PATH`` variable, or distribution ``/bin`` folder.

**Example for Sway config:**<br/>
``exec /path/to/cliphist-persist.sh``
