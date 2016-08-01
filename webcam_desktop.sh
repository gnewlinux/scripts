#!/bin/bash

mplayer -tv driver=v4l2:width=320:height=240:device=/dev/video0 -vo xv tv:// -geometry "99%:98%" -noborder -ontop
