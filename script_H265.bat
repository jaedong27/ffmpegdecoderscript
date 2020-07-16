set width=3840
for /F "tokens=*" %%A in (list.txt) do (
    ECHO %%A
    ffmpeg -i %%A -c:v hevc_nvenc -b:v 25M -maxrate 30M -pix_fmt yuv420p %%~nA___temp.ts
    ffmpeg -i %%~nA___temp.ts -c:v copy %%~nA___temp_ns.mp4
    ffmpeg -i %%~nA___temp_ns.mp4 -c:v hevc_nvenc -b:v 25M -maxrate 30M -pix_fmt yuv420p -vf scale=%width%:-1 %%~nA_H265.mp4
    del %%~nA___temp.ts
    del %%~nA___temp_ns.mp4
)