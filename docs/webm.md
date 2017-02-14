How to make webms
-----------------

ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 1M -c:a libvorbis output.webm
nice.
