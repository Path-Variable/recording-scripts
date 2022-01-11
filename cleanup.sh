#/bin/sh

## delete anything older than 7 days
## assumes folder structure like /base/cameras/location/room
find /base/cameras/*/*/* -type f -mtime +7 -exec rm -rf {} \;


