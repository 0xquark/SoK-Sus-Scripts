#!/usr/bin/env bash

startTime=$(date +%s%N)
elapsed=0

syncUp() {
    elapsed=$((elapsed + ($1 * 1000000000)))
    delta=$(echo "scale=10; (($startTime + $elapsed) - $(date +%s%N)) / 1000000000" | bc)
    echo "Sleep" $delta
    sleep $delta
}

qdbus org.kde.kate-`pidof kate` /MainApplication org.kde.Kate.Application.openUrl file:///katemainwindow.cpp utf-8
syncUp 5

# go to line 100
xdotool key Ctrl+g
xdotool type "100"
xdotool key Return
syncUp 5

# toggle comment
xdotool key Ctrl+slash
syncUp 1

# toggle comment
xdotool key Ctrl+slash
syncUp 1

# line down
xdotool key Down
xdotool key Down
syncUp 1

# toggle comment
xdotool key Ctrl+slash
syncUp 1

# find KConfig
xdotool key Ctrl+f
syncUp 1
xdotool type "KConfig"
syncUp 1

# next
xdotool key F3
syncUp 1
# next
xdotool key F3
syncUp 1
# next
xdotool key F3
syncUp 1
# next
xdotool key F3
syncUp 5

# prev
xdotool key Shift+F3
syncUp 1
# prev
xdotool key Shift+F3
syncUp 1

# close find bar
xdotool key Escape

# replace

syncUp 10

# go to line 200
xdotool key Ctrl+g
xdotool type "200"
xdotool key Return
syncUp 5

# select 10 lines
xdotool keydown Shift
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool keyup Shift
syncUp 1

# delete
xdotool key BackSpace
syncUp 5

# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 1

# delete line
xdotool key Ctrl+k
syncUp 5

# undo
xdotool key Ctrl+z
syncUp 1
# undo
xdotool key Ctrl+z
syncUp 1
 
# redo
xdotool key Ctrl+Shift+z
syncUp 5

# inc font size
xdotool key Ctrl+plus
syncUp 1

# inc font size
xdotool key Ctrl+plus
syncUp 5

# toggle folding 4x
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 5

# dec font size
xdotool key Ctrl+minus
syncUp 1

# dec font size
xdotool key Ctrl+minus
syncUp 5

# print preview
xdotool key Ctrl+Shift+p # custom
syncUp 5
xdotool key Escape

# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 1

# select 10 lines
xdotool keydown Shift
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool keyup Shift
syncUp 1

# cut
xdotool key Ctrl+x
syncUp 1

# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 1

# paste
xdotool key Ctrl+v
syncUp 5

# close
xdotool key Ctrl+w
syncUp 1

# dont save
xdotool key "Tab"
syncUp 1
xdotool key Return

# new file
xdotool key Ctrl+n
syncUp 5

# type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 3
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 3
xdotool type "sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
xdotool key Return
syncUp 3
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 3
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
syncUp 3

# toggle line numbers
xdotool key Ctrl+Shift+n # custom
syncUp 5

# select to beginning of line
xdotool key Shift+Home
syncUp 1

# uppercase
xdotool key Ctrl+u
syncUp 1

# toggle line numbers
xdotool key Ctrl+Shift+n # custom
syncUp 5

# lowercase
xdotool key Ctrl+Shift+u
syncUp 5

# new file
xdotool key Ctrl+n
syncUp 5

# type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 3
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 3
xdotool type "sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
xdotool key Return
syncUp 3
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 3
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
xdotool key Return
syncUp 3

xdotool key Ctrl+S
syncUp 1
xdotool type "somefile.txt"
xdotool key Return

