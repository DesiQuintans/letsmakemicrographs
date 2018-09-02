REM ------------------------------------------------------------
REM   Desi Quintans, 2018-09-02.
REM   Requires Image Magick 7.0.8-11 or later.
REM 
REM   This script automates transparency masking and the
REM   placement of the faux-ocular circular overlay and URL
REM   annotation on micrographs.
REM 
REM   All I have to do is drag one or more 1800×1800 px
REM   micrograph images onto this batch file, and it will
REM   produce finished micrographs in two sizes:
REM 
REM   1. 900×900 px, which is large enough to fit in a single
REM      screen.
REM   2. 1800×1800 px which, if printed at 300 DPI, can
REM      create a 6×6 inch print.
REM 
REM   The overlays are created by the 'make_overlays' batch
REM   file in the 'overlays/' folder. The overlay can be
REM   edited by changing that batch file and then running it.
REM ------------------------------------------------------------

FOR %%i IN (%*) DO (
    REM 1800-pixel image first. The first composite uses the
    REM mask to cut out the periphery of the micrograph. The
    REM second composite drops the overlay on top of it.
    magick convert -sharpen 0x1 %%i "%~dp0\%%~ni.tmp.png"
    magick composite -compose Dst_In -gravity center "%~dp0\overlays\mask_1800.png" "%~dp0\%%~ni.tmp.png" -alpha Set "%~dp0\%%~ni.tmp.png"
    magick composite -compose Over -gravity center "%~dp0\overlays\overlay_1800.png" "%~dp0\%%~ni.tmp.png" -alpha Set "%~dp0\%%~ni_1800.png"


    REM Now the 900-pixel image. I sharpen it before shrinking,
    REM which is part of my manual workflow in IrfanView.
    magick convert -sharpen 0x1 -resize 900x900 %%i "%~dp0\%%~ni.tmp.png"
    magick composite -compose Dst_In -gravity center "%~dp0\overlays\mask_900.png" "%~dp0\%%~ni.tmp.png" -alpha Set "%~dp0\%%~ni.tmp.png"
    magick composite -compose Over -gravity center "%~dp0\overlays\overlay_900.png" "%~dp0\%%~ni.tmp.png" -alpha Set "%~dp0\%%~ni_900.png"

    REM Clean up the temporary file.
    del "%~dp0\%%~ni.tmp.png"
)




