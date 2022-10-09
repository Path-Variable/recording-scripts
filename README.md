# recording-scripts
This repository holds the scripts and a systemd service template I have used when making my bash-based NVR system. You can find a link to the presentation 
outlining the project [here](https://bit.ly/3n8DRRl).

The scripts are written in bash.

I will outline their purpose here in short.

 1. cleanup.sh - This will remove any video files in X path after the given X days that are specified as a command line argument
 2. location-room.service - this system service will execute the recording script and make sure it restarts in case of system reboot
 3. record-location-room.sh - this is the main recording script. it calls ffmpeg and creates an apendable video file for the whole day
 4. remux.sh - this script will convert the previous days recording into an mp4 file extension
 5. watchdog.sh - this script serves a watchdog function that will check if the ffmpeg recording has stalled and restart it

Another possible approach when recording is to use the built-in segmentation feature of ffmpeg and have it record in smaller chunks with
a non-appendable format. That way you can still recover from errors and use less space. The drawback is that you will have to concatenate
these small chunks at one point. The operation is not resource intensive but you need to have additional space available during that time, 
write a script for it and schedule it with crontab.
