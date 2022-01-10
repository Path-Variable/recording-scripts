#/bin/sh

## delete anything older than 3 days
## assumes folder structure like /base/cameras/location/room
find /base/path/to/recordings/*/*/*/ -type d -mtime +7 -exec rm -rf {} \;


