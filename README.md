# ImageJ_miscellaneous
Various tools for ImageJ / Fiji:
- Fiji macro **syntax highlighting** for Notepad-plusplus.xml (Upload this file in "Language > User-defined language > import")
To run it from notepad, use "execute" with following full path (do not modify the end):

    <YourPathToImageJOrFiji...exe> -macro "$(FULL_CURRENT_PATH)"

- **3D-image_time-interpolator.ijm** is a macro that generates intermediate 3D images between two initial 3D images. Interpolation is linear for each pixel. This was created for visual creation purpose only. To use it, open your two 3D images in ImageJ and run the macro... Sample zip contains demo images as maximum projections (for faster overview), but were processed as 3D. You can do it yourself as these images were extracted from the sample library of ImageJ (mitosis 5D).
