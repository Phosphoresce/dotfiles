How to make webms
-----------------

ffmpeg -i input.mp4 -c:v libvpx-vp9 -b:v 1M -c:a libvorbis output.webm
-threads 3: for 4 cores 
-an: for no audio
-speed 0: for lowest file sizes

for two pass encoding:
ffmpeg -i input.mp4 -c:v libvpx-vp9 -pass 1 -qmin 0 -qmax 50 -crf 10 -b:v 1M -threads 1 -tile-columns 0 -speed 4 -g 128 -aq-mode 0 -an -sn -f webm /dev/null
ffmpeg -i input.mp4 -c:v libvpx-vp9 -pass 2 -qmin 0 -qmax 50 -crf 10 -b:v 1M -c:a libopus -b:a 64K -vbr on -threads 1 -tile-columns 0 -speed 0 -auto-alt-ref 1 -lag-in-frames 25 -g 128 -aq-mode 0 -sn -f webm output.webm

nice.
