#!/bin/bash
#
# This script is a handler for ssh:// urls. It will open the requested ssh
# connection in a new window, inside a dedicated tmux session. It will then
# force switch all the connected clients to the newly created window.
#

# Name of the dedicated session
TARGET_SESSION=ssh

# TODO: better argument handling ?
# Arguments handling
CONNECTION_STRING=${1#ssh://}

## Check if we're nesting tmux sessions
[[ -n $TMUX ]] && echo "Unset TMUX variable in your environment if you know what you are doing" && exit 1

if ! (tmux list-sessions | grep "^$TARGET_SESSION:"); then
	tmux new-session -d -s $TARGET_SESSION -n local
fi

WINDOW_NAME=$CONNECTION_STRING
tmux new-window -n "$WINDOW_NAME" -t $TARGET_SESSION "ssh $CONNECTION_STRING"

tmux list-clients | while read client
do
	tmux switch-client -c $(cut -d: -f1 <<< $client) -t ssh:$WINDOW_NAME
done

