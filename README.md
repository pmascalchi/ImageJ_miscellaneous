# ImageJ_miscellaneous

> **Important:** to get the files, you can click on their names in the list above, then right click on "RAW" (top-right button above text) and select "Save link as...".

Various tools for ImageJ / Fiji:

- **Useful Fiji toolbar v1.7**: This Fiji toolbar will give you a faster access to useful and classic functions, e.g. 
  - open a complex file = Bio-Formats importer, 
  - save as tiff, save as jpeg, 
  - channel overlay display (i.e. composite mode), 
  - quick scale bar, etc. 

Please note that some of the functions included in the file are original and won't be found through Fiji menu. If you don't like any of the buttons I chose, you can contact me and suggest another function instead...
Associated content:
  - the Fiji macro file to replace the original "StartupMacros.fiji.ijm" in the subfolder "/macros", 
  - a quick guide for the buttons of the toolbar. 

Installation note: rename the original "StartupMacros.fiji.ijm" file to create a back-up, in case you're not happy with the new toolbar. Note for mac users: to access the macros subfolder, go to "Applications", right-click or ctrl-click on the Fiji icon and select "show package content". Then you will be able to copy/paste the new "StartupMacros.fiji.ijm" file.

Tested with FijiImageJ v1.47/v1.48

- **3D-image_time-interpolator.ijm** is a macro that generates intermediate 3D images between two initial 3D images. Interpolation is linear for each pixel. This was created for visual creation purpose only. To use it, open your two 3D images in ImageJ and run the macro... Sample zip contains demo images as maximum projections (for faster overview), but were processed as 3D. You can do it yourself as these images were extracted from the sample library of ImageJ (mitosis 5D).

- Fiji macro **syntax highlighting** for Notepad-plusplus (.xml file). To be uploaded through "Language > User-defined language > import").
To run the macro code in ImageJ/Fiji from notepad++, click on "Run" (or "Execute") in the menu and write the following full path (replace only the part between <>):

       <YourPathToImageJOrFiji...exe> -macro "$(FULL_CURRENT_PATH)"

    You have an option to save that run command and associate a shortcut to it (e.g. Alt + R).

- **Auto-completion** for Notepad-plusplus (.xml file). To be copied in ..\Notepad++\plugins\APIs\
Name of the file should be exactly the name that you gave to your ImageJ langage in Notepad-plusplus...
Please pay attention that this dictionary has been generated from the webpage https://imagej.nih.gov/ij/developer/macro/functions.html and captured on the 2nd of July 2018. There is no automated update...
Result is not perfect but helps. Auto-completion as a Fiji plugin exists as well...

- **Icon generator for ImageJ menu (Excel macro)**: Use Excel to easily create a simple icon for the menu bar in ImageJ. This excel macro will allow you to draw manually a colored 16x16 pixels "icon" image and then get the corresponding ImageJ code (to be used for instance in "Startup Macros" file). You will have further guidelines within the excel file. Restriction: Your Excel version should accept the .XLSM format.
