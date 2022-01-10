TS_DAY=$(date +%Y_%m_%d)
mkdir -p -- /base/cameras/location/room/
ffmpeg -rtsp_transport tcp -i rtsp://your-rtsp-url -c copy -acodec aac -f mpegts - >>  /base/cameras/location/room/$TS_DAY.ts

