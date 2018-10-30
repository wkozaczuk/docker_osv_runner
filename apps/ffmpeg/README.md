This app combines ffmpeg with REST API server, HTML5 hashboard app /dashboard and comman line /cli (look [here](https://github.com/wkozaczuk/osv-html5-terminal) for more details).

The app on startup listen for API request and in order to exercise ffmpeg one can make /app PUT request to execute arbitrary ffmpeg command.

Here are some examples of commands that can be executed:
```
/ffmpeg.so -i http://clips.vorwaerts-gmbh.de/VfE_html5.mp4 # Get video file spec
/ffmpeg.so -i http://clips.vorwaerts-gmbh.de/VfE_html5.mp4 -ss 00:00:10 -codec copy -t 10 output.mp4 #extract 10 seconds of video starting at 10 seconds offset
/ffmpeg.so -i http://clips.vorwaerts-gmbh.de/VfE_html5.mp4 -r 1 -f image2 image-%2d.png #extract png image for each second of video
```

Run this to compose:
```
capstan package compose ffmpeg-example
```
Run this run the app:
```
capstan run ffmpeg-example -p qemu --boot default -f "8000:8000"
```
