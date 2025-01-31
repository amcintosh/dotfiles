#!/bin/bash
source $HOME/.dotfiles/config/backup-env.sh

/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ $@

# Unset variables
unset BACKUP_BUCKET
unset B2_ACCOUNT_ID
unset B2_ACCOUNT_KEY
unset RESTIC_PASSWORD
