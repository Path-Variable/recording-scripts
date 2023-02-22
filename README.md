# recording-scripts v2
This repository holds the scripts and a systemd service template I have used when making my bash-based NVR system. You can find a link to the presentation 
outlining the project [here](https://bit.ly/3n8DRRl).

The scripts are written in bash.

This is version 2 of the scripts. The second version uses the systemd service template concept as well as the environment file concept
to make deployment of each camera service simpler. All the variable parts of the recording script are stored in an environment file.
The user will create one environment file per camera. The file should specify the camera properties, the base path for the recordings
and the path to record.sh.

There is only one recording script - record.sh. The user should read it to get familiar with the variables and their role. There is no need
to modify the recording script.

There is only one systemd service file - record@.service. The user needs to edit the file before copying to the systemd service folder and specify
the base path to the environment files and the path to the watchdog script.


In order to deploy a script (once copied to the systemd folder) the user will execute the following command template:

    sudo systemd daemon-reload
    sudo systemd start record@camera.service
    sudo systemd enable record@camera.service

As a result of this command systemd will look for an environment file named camera.env located in the folder specified in the service file.
It will load all the variables contained within and run watchdog.sh. Watchdog will then run the recording script and poll for liveness every
16 seconds.

The recordings will be written in TS format to allow for appending in case of service failure. There will be only one recording per day.
Each recording will have the format of YYYY_MM_DD.ts

If you have any questions or think you have encountered a bug, please open an issue on [Github](https://github.com/Path-Variable/recording-scripts/issues).
