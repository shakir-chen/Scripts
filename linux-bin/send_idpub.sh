#!/bin/bash

# ssh-copy-id -i rsa_id.pub xuanqi@young.ece.ust.hk
# ssh-copy-id -i rsa_id.pub xuanqi@passion.ece.ust.hk
# ssh-copy-id -i rsa_id.pub xuanqi@rostam.ece.ust.hk
# ssh-copy-id -i rsa_id.pub xuanqi@magic.ece.ust.hk
# ssh-copy-id -i rsa_id.pub zhehui@rostam.ece.ust.hk
# ssh-copy-id -i rsa_id.pub zhehui@fantasy.ece.ust.hk

pubkey=i3_rsa_id.pub

ssh-copy-id -i $pubkey xuanqi@young.ece.ust.hk
ssh-copy-id -i $pubkey xuanqi@passion.ece.ust.hk
ssh-copy-id -i $pubkey xuanqi@rostam.ece.ust.hk
ssh-copy-id -i $pubkey xuanqi@magic.ece.ust.hk
ssh-copy-id -i $pubkey zhehui@rostam.ece.ust.hk #school+oldlabname
ssh-copy-id -i $pubkey zhehui@fantasy.ece.ust.hk

# ssh-copy-id -i $pubkey xuanqi@iron.ece.ust.hk
