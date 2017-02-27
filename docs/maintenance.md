System Maintanence
==================

Check for errors
----------------
Checked failed units
`systemctl --failed`

Check log files
`journalctl -p 3 -xb`

Backup
------
rsync
`rsync -azq local remote:/path/to/backup`

package list
`pacman -Qqe > ~/.pkgs`

reinstall packages
`pacman -S - < ~/.pkgs`

Pacman
------
Look into using reflector package

Update mirrorlist
`~/Scripts/update-mirrors.sh`

Remove orphans
`~/Scripts/rmorphans.sh`
