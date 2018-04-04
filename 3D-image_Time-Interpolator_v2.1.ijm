// Macro written by Patrice Mascalchi - 2018
// Input: 2 z-stacks
// Output: Z-stack timelapse with user-defined nb of timepoints
// v2: faster but more memory consuming / without pixel value collection


// list all opened images and select two of them
allImg = getList("image.titles");

Dialog.create("Image selection");
Dialog.addChoice("First image: ", allImg);
Dialog.addChoice("Second image: ", allImg);
Dialog.addNumber("Number of timepoints: ", 100, 0, 6, "frames");
Dialog.show();

img1 = Dialog.getChoice();
img2 = Dialog.getChoice();
nbTps = Dialog.getNumber();
if (img1 == img2) exit("Error: same image selected");

setBatchMode(true);

// get dimensions
selectWindow(img1);
getDimensions(wi1, he1, ch1, sl1, fr1);
bitD = bitDepth();
if (bitD == 24) exit("error: color processing not included in this version");
run("Duplicate...", "duplicate title=first.tif");
selectWindow(img2);
getDimensions(wi2, he2, ch2, sl2, fr2);
getVoxelSize(pxw, pxh, pxd, unit);

if (wi1 != wi2 || he1 != he2) exit("Input images do not have the same XY dimensions");
if (sl1 != sl2) exit("Input images do not have the same Z dimensions");
if (ch1 > 1 || ch2 > 1) exit("error: not expecting multichannel as input");
if (fr1 > 1 || fr2 > 1) exit("error: not expecting timelapse as input");

// interpolation based on linear progression a*x+b: calculating basis for 'a'
imageCalculator("Subtract create 32-bit stack", img2, img1);
rename("diff.tif");

selectWindow(img1);
rename("final.tif");

for (t=1; t<nbTps; t++) {
	selectWindow("diff.tif");
	run("Duplicate...", "duplicate title=add.tif");
	run("Multiply...", "value="+ (t / (nbTps-1)) +" stack");
	imageCalculator("Add create 32-bit stack", "first.tif", "add.tif");
	setMinAndMax(0, pow(2, bitD)-1);
	run(bitD +"-bit");
	rename("next.tif");
	
	// Concatenate
	run("Concatenate...", "  title=final.tif image1=final.tif image2=next.tif image3=[-- None --]");
	close("add.tif");
	close("next.tif");
}

close("diff.tif");
run("Stack to Hyperstack...", "order=xyczt(default) channels=1 slices="+ sl1 +" frames="+ nbTps +" display=Grayscale");

setBatchMode("exit and display");
waitForUser("Done!");