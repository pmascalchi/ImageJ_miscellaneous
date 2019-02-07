# ImageJ_miscellaneous

> **Important:** to get the files, you can click on their names in the list above, then right click on "RAW" (top-right button above text) and select "Save link as...".

Various tools for ImageJ / Fiji:
- Fiji macro **syntax highlighting** for Notepad-plusplus (.xml file). To be uploaded through "Language > User-defined language > import").
To run the macro code in ImageJ/Fiji from notepad++, click on "Run" (or "Execute") in the menu and write the following full path (replace only the part between <>):

       <YourPathToImageJOrFiji...exe> -macro "$(FULL_CURRENT_PATH)"

    You have an option to save that run command and associate a shortcut to it (e.g. Alt + R).

- **Auto-completion** for Notepad-plusplus (.xml file). To be copied in ..\Notepad++\plugins\APIs\
Name of the file should be exactly the name that you gave to your ImageJ langage in Notepad-plusplus...
Please pay attention that this dictionary has been generated from the webpage https://imagej.nih.gov/ij/developer/macro/functions.html and captured on the 2nd of July 2018. There is no automated update...
Result is not perfect but helps. Auto-completion as a Fiji plugin exists as well...

- **3D-image_time-interpolator.ijm** is a macro that generates intermediate 3D images between two initial 3D images. Interpolation is linear for each pixel. This was created for visual creation purpose only. To use it, open your two 3D images in ImageJ and run the macro... Sample zip contains demo images as maximum projections (for faster overview), but were processed as 3D. You can do it yourself as these images were extracted from the sample library of ImageJ (mitosis 5D).
