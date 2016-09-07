#!/bin/bash

if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
fi
# TITLE="\[\e]2;$*\a\]"

TITLE="\[\e]2;$1\a\]"
# PS1=${ORIG}${TITLE}
export PS1=${ORIG}${TITLE}
