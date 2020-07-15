set width=3840
for /F "tokens=*" %%A in (list.txt) do (
    ECHO %%A
    ffmpeg -i %%A -c:v copy -sn -dn -an %%~nA.ts
    ffmpeg -i %%~nA.ts -c:v copy %%~nA_ns.mp4
    ffmpeg -i %%~nA_ns.mp4 -c:v h264_nvenc -b:v 25M -maxrate 30M -pix_fmt yuv420p -vf scale=%width%:-1 %%~nA_H264.mp4
)