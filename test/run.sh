#!/bin/bash

echo ""
echo "discovery:"
echo ""
echo "# ffmpeg -list_devices 1 -f decklink -i dummy"
echo "# ffmpeg -list_formats 1 -f decklink -i 'DeckLink SDI (1)'"
echo ""
echo "record:"
echo ""
echo "# ffmpeg -y -f decklink -i 'DeckLink SDI (1)@9' -c:a copy -c:v copy /srv/out/output.avi"
echo "# ffmpeg -y -f decklink -i 'DeckLink SDI (1)@9' -c:a aac -b:a 128k -vf yadif -c:v libx264 -crf 23 /srv/out/output.mp4"
echo ""
exec docker run --name ffmpeg-test -it --rm --privileged \
       -v /usr/lib/libDeckLinkAPI.so:/usr/lib/libDeckLinkAPI.so \
       -v /usr/lib/libDeckLinkPreviewAPI.so:/usr/lib/libDeckLinkPreviewAPI.so \
       -v /dev/blackmagic:/dev/blackmagic -v /tmp/out:/srv/out spreadspace/ffmpeg bash
