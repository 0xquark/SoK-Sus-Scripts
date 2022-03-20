#!/usr/bin/env bash

startTime=$(date +%s%N)
elapsed=0

syncUp() {
    elapsed=$((elapsed + ($1 * 1000000000)))
    delta=$(echo "scale=10; (($startTime + $elapsed) - $(date +%s%N)) / 1000000000" | bc)
    echo "Sleep" $delta
    sleep $delta
}

echo "Started"
# gets window id of the kate and stores it in window_id
window_id=$(wmctrl -l | awk '/katemainwindow.cpp  — Kate/ {print strtonum($1)}')
xdotool windowactivate "$window_id"
syncUp 60
syncUp 5

echo " Go to line 100"
# go to line 100
xdotool key Ctrl+g
xdotool type "100"
xdotool key Return
syncUp 5

echo " Toggle Comment"
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

echo " Find KConfig and Move between searches"
# find KConfig
xdotool key Ctrl+f
syncUp 3
xdotool type "KConfig"
syncUp 2

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
# standby time 
echo " Standby "
syncUp 30

echo " Go to line 200 "
# go to line 200
xdotool key Ctrl+g
xdotool type "200"
xdotool key Return
syncUp 5

echo " Select ten lines"
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
syncUp 3

echo " Delete "
# delete
xdotool key BackSpace
syncUp 10

echo " Go 5 lines down "
# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 2

echo " delete "
# delete line
xdotool key Ctrl+k
syncUp 10

echo " undo "
# undo
xdotool key Ctrl+z
syncUp 2
# undo
xdotool key Ctrl+z
syncUp 2
 
echo " redo "
# redo
xdotool key Ctrl+Shift+z
syncUp 5

echo " Increase font size "
# inc font size
xdotool key Ctrl+plus
syncUp 1

# inc font size
xdotool key Ctrl+plus
syncUp 5

echo " Toggle Folding "
# toggle folding 4x
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 1
xdotool key Ctrl+Shift+k # custom
syncUp 5

echo " Decrease Font Size "
# dec font size
xdotool key Ctrl+minus
syncUp 1

# dec font size
xdotool key Ctrl+minus
syncUp 5

# Enter full screen mode
echo " Enter and Exit Full screen mode "
xdotool key F11
syncUp 5
xdotool key F11
syncUp 5

echo " Print Preview "
# print preview
xdotool key Ctrl+Shift+p # custom
syncUp 5
xdotool key Escape
syncUp 1

echo " Set Bookmark "
# set Bookmark
xdotool key Down
xdotool key Down
syncUp 2
xdotool key Ctrl+b
syncUp 3

echo " Go 5 lines down "
# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 3
xdotool key Down
xdotool key Down
syncUp 3

echo " Select 10 lines "
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
syncUp 6

echo " Cut "
# cut
xdotool key Ctrl+x
syncUp 5

echo " Standby 60 sec "
syncUp 60

echo " Go 5 lines down "
# go 5 lines down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
xdotool key Down
syncUp 3

echo " Paste "
# paste
xdotool key Ctrl+v
syncUp 5


echo " close "
# close
xdotool key Ctrl+w
syncUp 3

echo " Discard the current file "
# dont save
xdotool key "Tab"
syncUp 3
xdotool key Return
syncUp 5
		
echo " Create New file "
# new file
xdotool key Ctrl+n
syncUp 5

echo " Type lorem ipsum "
# type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 5
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 5
xdotool type "sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
xdotool key Return
syncUp 5
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 5
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
syncUp 10

echo " Enable Spell checking "
#enable spell checking 
xdotool key Ctrl+Shift+O
syncUp 5

echo " Toggle line numbers "
# toggle line numbers
xdotool key Ctrl+Shift+n # custom
syncUp 5

echo " Go to the begining of the line "
# select to beginning of line
xdotool key Shift+Home
syncUp 5

echo " Change font "
#change font 
xdotool key ctrl+shift+comma
syncUp 3
xdotool key Tab
xdotool key Tab
xdotool key Tab
syncUp 3
xdotool key Tab
xdotool key Return
syncUp 5
xdotool key ISO_Left_Tab
xdotool key ISO_Left_Tab
xdotool key ISO_Left_Tab
syncUp 3
xdotool key Down
xdotool key Down
xdotool key Return
syncUp 5
xdotool key ISO_Left_Tab
xdotool key Return
syncUp 5

echo " Disable Spell checking "
# Disable Spell checking 
xdotool key Ctrl+Shift+O
syncUp 5

echo " Uppercase "
# uppercase
xdotool key Ctrl+u
syncUp 3

echo " Toggle line numbers "
# toggle line numbers
xdotool key Ctrl+Shift+n # custom
syncUp 5

echo " lowercase "
# lowercase
xdotool key Ctrl+semicolon # custom
syncUp 5

echo " Standby 60 sec "
syncUp 60

echo " close "
# close
xdotool key Ctrl+w
syncUp 1

echo " Discard the current file "
# dont save
xdotool key "Tab"
syncUp 1
xdotool key Return
syncUp 5

echo "***********Normal User*********** "

echo " Create New file "
# new file
xdotool key Ctrl+n
syncUp 5

echo " Type lorem ipsum "
# type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 5
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 5
xdotool type "sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
xdotool key Return
syncUp 5
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 5
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
xdotool key Return
syncUp 5

echo " Increase font size "
# inc font size
xdotool key Ctrl+plus
syncUp 1
# inc font size
xdotool key Ctrl+plus
syncUp 5

echo " Type lorem ipsum  "
# Type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 5
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 5

echo " Decrease font size "
# dec font size
xdotool key Ctrl+minus
syncUp 1
# dec font size
xdotool key Ctrl+minus
syncUp 5

echo " Go to line 3"
# go to line 100
xdotool key Ctrl+g
xdotool type "3"
xdotool key Return
syncUp 5

echo " Select 2 lines "
# Select 2 lines
xdotool keydown Shift
xdotool key Down
xdotool key Down
xdotool keyup Shift
syncUp 2

echo " Delete "
# Delete
xdotool key BackSpace
syncUp 10

echo " Undo "
# undo
xdotool key Ctrl+z
syncUp 5

echo " redo "
# redo 
xdotool key Ctrl+Shift+z
syncUp 5

# Enter full screen mode
echo " Enter and Exit Full screen mode "
xdotool key F11
syncUp 5
xdotool key F11
syncUp 5

# Save file 
echo " Save file "
xdotool key Ctrl+S
syncUp 2
xdotool type "somefile.txt"
syncUp 2
xdotool key Return
syncUp 5

echo " **********Lite Mode******** "

echo " Create New file "
# new file
xdotool key Ctrl+n
syncUp 5

echo " Type lorem ipsum "
# type lorem ipsum
xdotool type "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
xdotool key Return
syncUp 5
xdotool type "aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata"
xdotool key Return
syncUp 5
xdotool type "sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor"
xdotool key Return
syncUp 5
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 5
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
xdotool key Return 
syncUp 5

echo " Go to line 1"
# go to line 100
xdotool key Ctrl+g
xdotool type "1"
xdotool key Return
syncUp 5

echo " Select 2 lines "
# Select 2 lines
xdotool keydown Shift
xdotool key Down
xdotool key Down
xdotool keyup Shift
syncUp 2

echo " Delete "
# Delete
xdotool key BackSpace
syncUp 10

echo " Type lorem ipsum "
# type text
xdotool type "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet"
xdotool key Return
syncUp 3
xdotool type "clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet"
xdotool key Return 
syncUp 3

echo " standby 30 sec "
syncUp 30

echo " close "
# close
xdotool key Ctrl+w
syncUp 1

echo " Discard the current file "
# dont save
xdotool key "Tab"
syncUp 1
xdotool key Return
syncUp 2

echo " Quit Kate "
xdotool key Ctrl+Q
syncUp 2
xdotool key ISO_Left_Tab
syncUp 1
xdotool key Return 






