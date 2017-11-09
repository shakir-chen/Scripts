#!/bin/bash

# bluetoothctl << EOF
# devices
# EOF

# FC:A8:9A:A3:56:7C       left ear
# FC:A8:9A:A3:50:7A       right ear
# 6E:B9:6B:D7:D2:AE     iphone (don't know)

bluetoothctl << EOF
power on
agent on
connect FC:A8:9A:A3:50:7A
EOF
# connect FC:A8:9A:A3:56:7C

