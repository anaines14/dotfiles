#!/bin/sh

while true; do
  hours="$(date +'%H')"
  if [ "$hours" -ge 21 ] || [ "$hours" -lt 8 ]; then
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 3000
  else
    busctl --user -- set-property rs.wl-gammarelay / rs.wl.gammarelay Temperature q 6500
  fi
  sleep 5m
done
