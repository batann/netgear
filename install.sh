#!/bin/bash
CONF="/home/batan/.lcconfig"
BASE="$CONF/netgear"
clear
if [[ ! -d "$CONF" ]]; then
  echo -e "The lcconfig file does not exist, exiting..."
fi
sudo mv $HOME/netgear $CONF
sudo chmod +x $BASE/lc-netgear
sudo chmod +x $BASE/src/get-data.sh"
if [[ ! -f "/usr/bin/lc-netgeat" ]]; then
  sudo cp $BASE/lc-netgear /usr/bin
  sudo chmod +x /usr/bin/lc-*
  fi

nohup sudo -u batan bash $BASE/src/get-data.sh &
PID_get-data=$!
echo -e "PID_get-data.sh: $PID_get-data"




