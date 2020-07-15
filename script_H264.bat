set width=3840
for /F "tokens=*" %%A in (list.txt) do (
    ECHO %%A
    ECHO 
    ffmpeg -i %%A -c:v h264_nvenc -b:v 25M -maxrate 30M -pix_fmt yuv420p -vf scale=%width%:-1 %%~nA_H264.mp4
)