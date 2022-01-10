file_name=$(date --date="yesterday" +%Y_%m_%d)
for location_name in /base/cameras/*/* ; do
	ffmpeg -i ${location_name}/${file_name}.ts -c copy ${location_name}/${file_name}.mp4 && rm ${location_name}/${file_name}.ts
done

