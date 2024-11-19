#!/bin/sh

while true; do
  hours="$(date +'%H')"
  next_proc=5
  if [ "$hours" -ge 21 ] || [ "$hours" -lt 8 ]; then
    next_proc=$(((24 - hours + 8 - 1) * 60 + 5))
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3000
  elif [ "$hours" -lt 8 ]; then
    next_proc=$(((8 - hours - 1) * 60 + 5))
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3000
  else
    next_proc=$(((21 - hours - 1) * 60 + 5))
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500
  fi
  echo "Will trigger again in ${next_proc}m"
  sleep "${next_proc}m"
done
