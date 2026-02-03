@echo off
setlocal

if not exist build mkdir build || exit /b 1

pushd build || exit /b 1

cl /nologo /TC /Zi /Fe:load81.exe ..\main.c ^
  /I..^
  /I..\libs\SDL2\include ^
  /I..\libs\SDL2_gfx\include ^
  /I..\libs\SDL2_image\include ^
  /I..\libs\lua\include ^
  /link /SUBSYSTEM:CONSOLE ^
  /LIBPATH:..\libs\SDL2\lib\x64 ^
  /LIBPATH:..\libs\SDL2_gfx\lib\x64 ^
  /LIBPATH:..\libs\SDL2_image\lib\x64 ^
  /LIBPATH:..\libs\lua ^
  SDL2.lib SDL2_image.lib SDL2_gfx.lib lua51.lib SDL2main.lib Shell32.lib || exit /b 1

copy ..\libs\SDL2\lib\x64\SDL2.dll             . || exit /b 1
copy ..\libs\SDL2_image\lib\x64\SDL2_image.dll . || exit /b 1
copy ..\libs\SDL2_gfx\lib\x64\SDL2_gfx.dll     . || exit /b 1
copy ..\libs\lua\lua51.dll                     . || exit /b 1

popd

echo.
echo Build complete!
