#!/bin/bash

STATEFILE="/tmp/hypr_rotation_state"

# Current rotation (default = 0)
if [[ -f "$STATEFILE" ]]; then
    state=$(cat "$STATEFILE")
else
    state=0
fi

# Next rotation
case "$state" in
    0)
        next=1
        ;;
    1)
        next=2
        ;;
    2)
        next=3
        ;;
    *)
        next=0
        ;;
esac

# Apply rotation
hyprctl keyword monitor "eDP-1,preferred,auto,1,transform,$next"

# Save state
echo "$next" > "$STATEFILE"
