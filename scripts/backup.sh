#!/bin/bash
# replace with your backup server domain name or ip
REMOTE=backup.server.io

sudo rsync -av ~/ $USER@$REMOTE:~/$USER/$(hostname)/backup
