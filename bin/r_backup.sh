#!/bin/bash
source $HOME/.dotfiles/config/backup-env.sh

# Backup
/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ backup ~/Documents
/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ backup ~/Desktop
/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ backup --exclude-file "Photos Library.photoslibrary" ~/Pictures
/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ backup ~/Movies

# Remove snapshits according to policy
/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ forget --keep-daily 7 --keep-weekly 4 --keep-monthly 12 --keep-yearly 3

/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ prune

/usr/local/bin/restic -r b2:${BACKUP_BUCKET}:/ check

# Unset variables
unset BACKUP_BUCKET
unset B2_ACCOUNT_ID
unset B2_ACCOUNT_KEY
unset RESTIC_PASSWORD