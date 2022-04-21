#!/usr/bin/env bash

startTime=$(date +%s%N)
elapsed=0

# syncUp function is used to get accurate time to be elapsed
syncUp() {
    elapsed=$((elapsed + ($1 * 1000000000)))
    delta=$(echo "scale=10; (($startTime + $elapsed) - $(date +%s%N)) / 1000000000" | bc)
    echo "Sleep" $delta
    sleep $delta
}

# timestamp function is used to output the time and action into log.csv file.
timestamp() {
    echo "iteration $1;$(date -I) $(date +%T);$2 " >> ~/log.csv   

}

# Loop running for 30 times
# start loop
for ((i = 1 ; i <= 30 ; i++)); do
    
    timestamp "$i" "start iteration"
    echo "start iteration $i"
    syncUp 60
    kate ~/katemainwindow.cpp > /dev/null 2>&1 &   
    syncUp 5

    echo " go to line 100 "
    timestamp "$i" "go to line 100"
    # go to line 100
    xdotool key Ctrl+g
    xdotool type "100"
    xdotool key Return
    syncUp 5

    echo " toggle comment"
    timestamp "$i" "toggle comment"
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

    echo " find kConfig and move between searches"
    timestamp "$i" "find kconfig"
    # find KConfig
    xdotool key Ctrl+f
    syncUp 3
    xdotool type "KConfig"
    syncUp 2

    timestamp "$i" "move between searches 6 times "
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
	
    timestamp "$i" "close find bar"
    # close find bar
    xdotool key Escape

    # standby time
    timestamp "$i" "standby 30 sec"
    echo " standby "
    syncUp 30

    echo " go to line 200 "
    # go to line 200
    timestamp "$i" "go to line 200"
    xdotool key Ctrl+g
    xdotool type "200"
    xdotool key Return
    syncUp 5

    echo " select ten lines"
    # select 10 lines
    timestamp "$i" "select 10 lines"
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

    echo " delete "
    # delete
    timestamp "$i" "delete selected text"
    xdotool key BackSpace
    syncUp 10

    echo " go 5 lines down "
    # go 5 lines down
    timestamp "$i" "go 5 lines down"
    xdotool key Down
    xdotool key Down
    xdotool key Down
    xdotool key Down
    xdotool key Down
    syncUp 2

    echo " delete "
    # delete line
    timestamp "$i" "delete line"
    xdotool key Ctrl+k
    syncUp 10

    echo " undo "
    # undo
    timestamp "$i" "undo"
    xdotool key Ctrl+z
    syncUp 2
    # undo
    timestamp "$i" "undo again"
    xdotool key Ctrl+z
    syncUp 2

    echo " redo "
    # redo
    timestamp "$i" "redo"
    xdotool key Ctrl+Shift+z
    syncUp 5

    echo " increase font size "
    # inc font size
    timestamp "$i" "increase font size"
    xdotool key Ctrl+plus
    syncUp 1

    # inc font size
    xdotool key Ctrl+plus
    syncUp 5

    echo " toggle folding "
    # toggle folding 4x
    timestamp "$i" "toggle folding"
    xdotool key Ctrl+Shift+k # custom
    syncUp 1
    xdotool key Ctrl+Shift+k # custom
    syncUp 1
    xdotool key Ctrl+Shift+k # custom
    syncUp 1
    xdotool key Ctrl+Shift+k # custom
    syncUp 5

    echo " decrease font size "
    # dec font size
    timestamp "$i" "decrease font size "
    xdotool key Ctrl+minus
    syncUp 1

    # dec font size
    xdotool key Ctrl+minus
    syncUp 5

    echo " enter and exit full screen mode "
    # Enter full screen mode
    timestamp "$i" "enter full screen mode"
    xdotool key F11
    syncUp 5
    # Exit Full screen mode
    timestamp "$i" "exit full screen mode"
    xdotool key F11
    syncUp 5

    echo " print preview "
    # print preview
    timestamp "$i" "print preview"
    xdotool key Ctrl+Shift+p # custom
    syncUp 5
    xdotool key Escape
    syncUp 1

    echo " set bookmark "
    # set Bookmark
    timestamp "$i" "go 2 lines down"
    xdotool key Down
    xdotool key Down
    syncUp 2
    timestamp "$i" "set bookmark"
    xdotool key Ctrl+b
    syncUp 3

    echo " go 5 lines down "
    # go 5 lines down
    timestamp "$i" "go 5 lines down"
    xdotool key Down
    xdotool key Down
    xdotool key Down
    syncUp 3
    xdotool key Down
    xdotool key Down
    syncUp 3

    echo " select 10 lines "
    # select 10 lines
    timestamp "$i" "select 10 lines "
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

    echo " cut "
    # cut
    timestamp "$i" "cut"
    xdotool key Ctrl+x
    syncUp 5

    echo " standby 30 sec "
    # standby 30 sec
    timestamp "$i" "standby 30 sec"
    syncUp 30

    echo " go 5 lines down "
    # go 5 lines down
    timestamp "$i" "go 5 lines down"
    xdotool key Down
    xdotool key Down
    xdotool key Down
    xdotool key Down
    xdotool key Down
    syncUp 3

    echo " paste "
    # paste
    timestamp "$i" "paste"
    xdotool key Ctrl+v
    syncUp 5

    echo " close "
    # close
    timestamp "$i" "close"
    xdotool key Ctrl+w
    syncUp 3

    echo " discard the current file "
    # dont save
    timestamp "$i" "discard the current file "
    xdotool key "Tab"
    syncUp 3
    xdotool key Return
    syncUp 5

    # when you discard an old file , a new file is automatically created	

    echo " standby 5 sec "
    #standby 5 sec
    timestamp "$i" "standby 5 sec"
    syncUp 5

    echo " type lorem ipsum "
    # Type lorem ipsum
    timestamp "$i" "type lorem ipsum"
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

    echo " enable spell checking "
    #enable spell checking
    timestamp "$i" "enable spell checking"
    xdotool key Ctrl+Shift+O
    syncUp 5

    echo " toggle line numbers "
    # toggle line numbers
    timestamp "$i" "toggle line numbers"
    xdotool key Ctrl+Shift+n # custom
    syncUp 5

    echo " go to the begining of the line "
    # select to beginning of line
    timestamp "$i" "go to the begining of the line"
    xdotool key Shift+Home
    syncUp 5

    echo " change font "
    #change font
    timestamp "$i" "change font"
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

    echo " disable spell checking "
    # Disable Spell checking
    timestamp "$i" "disable spell checking"
    xdotool key Ctrl+Shift+O
    syncUp 5

    echo " uppercase "
    # uppercase
    timestamp "$i" "uppercase"
    xdotool key Ctrl+u
    syncUp 3

    echo " toggle line numbers "
    # toggle line numbers
    timestamp "$i" "toggle line numbers"
    xdotool key Ctrl+Shift+n # custom
    syncUp 5

    echo " lowercase "
    # lowercase
    timestamp "$i" "lowercase"
    xdotool key Ctrl+semicolon # custom
    syncUp 5


    echo " save file "
    timestamp "$i" "save file"
    xdotool key Ctrl+S
    syncUp 2
    xdotool type "somefile.txt"
    syncUp 2
    xdotool key Return
    syncUp 5

    echo " create new file "
    # new file
    timestamp "$i" "create new file"
    xdotool key Ctrl+n
    syncUp 5

    echo " type lorem ipsum "
    #  type lorem ipsum
    timestamp "$i" "type lorem ipsum"
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

    echo " quit kate "
    timestamp "$i" "quit kate"
    xdotool key Ctrl+1            #custom
    syncUp 2
    xdotool key ISO_Left_Tab
    syncUp 2
    xdotool key Return
    syncUp 5

    # stop iteration
    echo " stop  iteration "
    timestamp "$i" "stop iteration"

    # Remove logs
    rm ~/somefile.txt
    rm ~/.config/katerc
    rm ~/.local/share/kate
    rm ~/.config/katemetainfos

    clear

done

#end loop
#end script

