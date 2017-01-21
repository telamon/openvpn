#!/bin/sh

if [ -f "/tmp/orgip" ]; then
  ORIGINAL_ADDR=$(cat /tmp/orgip)
  CURRENT_ADDR=$(curl 'https://api.ipify.org' -s)
  if [ "$CURRENT_ADDR" = "$ORIGINAL_ADDR" ]; then
    exit 1
  else
    # Address is masked, all is working.
    exit 0
  fi
else
  echo "Warning: original address unknown, healthcheck is useless"
  exit 0
fi

