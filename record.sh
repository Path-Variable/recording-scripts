TS_DAY=$(date +%Y_%m_%d)
mkdir -p -- ${BASE_PATH}/${CAMERA_LOCATION}/${CAMERA_NAME}/
ffmpeg -rtsp_transport tcp -i rtsp://${CAMERA_IP}/user=admin_password=${CAMERA_PASSWORD}_channel=1_stream=0.sdp -c copy -acodec aac -f mpegts - >>  ${BASE_PATH}/${CAMERA_LOCATION}/${CAMERA_NAME}/${TS_DAY}.ts

