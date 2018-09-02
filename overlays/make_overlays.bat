REM ------------------------------------------------------------
REM   Desi Quintans, 2018-09-02.
REM   Requires Image Magick 7.0.8-11 or later.
REM 
REM   This script creates the mask and overlay graphics for
REM   micrographs. It makes them in two sizes:
REM 
REM   1. 900×900 px, which is large enough to fit in a single
REM      screen.
REM   2. 1800×1800 px which, if printed at 300 DPI, can
REM      create a 6×6 inch print.
REM 
REM   The overlays are put into this folder (the 'overlays'
REM   folder), and then accessed by the 'add_overlays' batch
REM   file which accepts a 1800×1800 px micrograph.
REM ------------------------------------------------------------


REM ------------------------------------------------------------
REM   Make the positive masks. Areas of black will be retained.

magick convert -size 900x900 xc:none ^
	-fill black -stroke black -draw "circle 450,450 898,450" ^
	mask_900.png

magick convert -size 1800x1800 xc:none ^
	-fill black -stroke black -draw "circle 900,900 1798,900" ^
	mask_1800.png

REM ------------------------------------------------------------
REM   Make the faux-ocular overlay image.

magick convert ^
       ( ^
           -size 900x900 xc:transparent ^
           -fill transparent -stroke white -strokewidth 2 -draw "circle 450,450 898,450" ^
           -blur 1 ^
           -fill none -stroke black -strokewidth 1 -draw "circle 450,450 896,450" ^
           -blur 1 ^
       ) ^
       -gravity southeast -font "Tw-Cen-MT" -pointsize 18 -stroke none -fill #C0C0C0 -annotate +10+10 letsmakemicrographs.com overlay_900.png


magick convert ^
       ( ^
           -size 1800x1800 xc:transparent ^
           -fill transparent -stroke white -strokewidth 6 -draw "circle 900,900 1798,900" ^
           -blur 2 ^
           -fill none -stroke black -strokewidth 3 -draw "circle 900,900 1796,900" ^
           -blur 2 ^
       ) ^
       -gravity southeast -font "Tw-Cen-MT" -pointsize 36 -stroke none -fill #C0C0C0 -annotate +10+10 letsmakemicrographs.com overlay_1800.png
       
