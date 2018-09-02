# letsmakemicrographs

## Batch files and other tools for working with micrographs

These batch files require Image Magick 7.0.8-11 or later. https://www.imagemagick.org/

I created them so that it would be easier for me to return to making micrographs at my hobby website
http://www.letsmakemicrographs.com even after a long absence — instead of having to remember how to
do a bunch of manual steps in GIMP and IrfanView, I can just drag and drop onto batch files.

### `make_overlays.bat`

This script creates the mask and overlay graphics for micrographs. It makes them in two sizes:
 
1. 900×900 px, which is large enough to fit in a single screen.
2. 1800×1800 px which, if printed at 300 DPI, can create a 6×6 inch print.

The mask and overlay images are created in the `overlays` folder, and then accessed by the `add_overlays_to_micrographs` batch file which accepts a 1800×1800 px micrograph.

### `add_overlays_to_micrographs.bat`

This script automates the process of cutting out my micrographs, masking them for transparency, and then overlaying decorative elements on top of them.

All I have to do is drag one or more 1800×1800 px micrograph images onto this batch file, and it will produce finished micrographs in two sizes:

1. 900×900 px, which is large enough to fit in a single screen.
2. 1800×1800 px which, if printed at 300 DPI, can create a 6×6 inch print.

The overlays are created by the `make_overlays` batch file in the `overlays` folder. The masks and overlays can be edited by changing that batch file and then running it. 
The finished images are created in the same folder as `add_overlays_to_micrographs.bat`.
