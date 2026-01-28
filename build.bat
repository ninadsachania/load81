@echo off

if not exist build mkdir build

cl /O2 /W4 /Fo:build\ /Fe:build\load81.exe main.c ^
  /I.\libs\SDL2\include ^
  /I.\libs\SDL2_gfx\include ^
  /I.\libs\SDL2_image\include ^
  /I.\libs\lua\include ^
  /link /SUBSYSTEM:CONSOLE ^
  /LIBPATH:libs\SDL2\lib\x64 ^
  /LIBPATH:libs\SDL2_gfx\lib\x64 ^
  /LIBPATH:libs\SDL2_image\lib\x64 ^
  /LIBPATH:libs\lua ^
  SDL2.lib SDL2_image.lib SDL2_gfx.lib lua51.lib SDL2main.lib Shell32.lib

copy libs\SDL2\lib\x64\SDL2.dll build\
copy libs\SDL2_image\lib\x64\SDL2_image.dll build\
copy libs\SDL2_gfx\lib\x64\SDL2_gfx.dll build\
copy libs\lua\lua51.dll build\

echo.
echo Build complete!