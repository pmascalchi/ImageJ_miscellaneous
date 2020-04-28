// "StartupMacros"
// The macros and macro tools in this file ("StartupMacros.txt") are
// automatically installed in the Plugins>Macros submenu and
//  in the tool bar when ImageJ starts up.

// -------------------------------------------------------------------
// Modified by: Patrice Mascalchi
// Date: 2014
// Location: Cancer Research Institute, University of Cambridge, UK
// Contact: patrice.mascalchi@gmail.com
// -------------------------------------------------------------------

function UseHEFT {
	requires("1.38f");
	state = call("ij.io.Opener.getOpenUsingPlugins");
	if (state=="false") {
		setOption("OpenUsingPlugins", true);
		showStatus("TRUE (images opened by HandleExtraFileTypes)");
	} else {
		setOption("OpenUsingPlugins", false);
		showStatus("FALSE (images opened by ImageJ)");
	}
}

UseHEFT();

// The macro named "AutoRun" runs when ImageJ starts.

macro "AutoRun" {
	// run all the .ijm scripts provided in macros/AutoRun/
	autoRunDirectory = getDirectory("imagej") + "/macros/AutoRun/";
	if (File.isDirectory(autoRunDirectory)) {
		list = getFileList(autoRunDirectory);
		// make sure startup order is consistent
		Array.sort(list);
		for (i = 0; i < list.length; i++) {
			if (endsWith(list[i], ".ijm")) {
				runMacro(autoRunDirectory + list[i]);
			}
		}
	}
}

/*
macro "Abort Macro or Plugin (or press Esc key) Action Tool - CbooP51b1f5fbbf5f1b15510T5c10X" {
	setKeyDown("Esc");
}
*/

macro "Open Action Tool - C037D11D21D31D41D12D52D13D63D73D83D93Da3Db3Dc3D14Dc4D15Dc5D16D56D66D76D86D96Da6Db6Dc6Dd6De6Df6D17D47Df7D18D48Df8D19D49Df9D1aD3aDeaD1bD3bDebD1cD3cDecD1dD2dDddD1eD2eDdeD1fD2fD3fD4fD5fD6fD7fD8fD9fDafDbfDcfDdf" {run("Bio-Formats Importer");}

macro "SaveTiff Action Tool - Cb00D11D21D31D41D51D61D71D81D91Da1Db1Dc1Dd1De1Df1D12Df2D13D33D43D53D63D73D83D93Da3Db3Dc3Dd3Df3D14D34Dd4Df4D15D35Dd5Df5D16D36Dd6Df6D17D37D47D57D67D77D87D97Da7Db7Dc7Dd7Df7D18Df8D19D39D49D59D79D99Da9Dc9Dd9Df9D1aD4aD7aD9aDcaDfaD1bD4bD7bD9bDabDcbDdbDfbD1cD4cD7cD9cDccDfcD1dD4dD7dD9dDcdDfdD1eDfeD1fD2fD3fD4fD5fD6fD7fD8fD9fDafDbfDcfDdfDefDff" {run("Tiff...");}

macro "SaveJpeg Action Tool - Cfb8D11D21D31D41D51D61D71D81D91Da1Db1Dc1Dd1De1Df1D12Df2D13D33D43D53D63D73D83D93Da3Db3Dc3Dd3Df3D14D34Dd4Df4D15D35Dd5Df5D16D36Dd6Df6D17D37D47D57D67D77D87D97Da7Db7Dc7Dd7Df7D18Df8D19D39D49D59D79D89D99Db9Dc9Dd9Df9D1aD4aD7aD9aDbaDfaD1bD4bD7bD8bD9bDbbDdbDfbD1cD4cD7cDbcDdcDfcD1dD3dD4dD7dDbdDcdDddDfdD1eDfeD1fD2fD3fD4fD5fD6fD7fD8fD9fDafDbfDcfDdfDefDff" {run("Jpeg...");}

macro "BC Action Tool - C037D33D43D53Dd3D34D54D64Dc4D35D45D55Db5D36D56D66Da6D37D47D57D97D88D79Da9Db9Dc9Dd9D6aDaaD5bDabD4cDacD3dDadDbdDcdDdd" {run("Brightness/Contrast...");}

var aCmds = newMenu("Colour Menu Tool",
newArray("Colour", "Composite", "-", "Make Composite", "-", "Blue", "Green", "Red", "Grays", "HiLo", "Invert LUT", "-", "Merge", "Merge at end"));

macro "Colour Menu Tool - Cb00T0b11CC0b0T7b09oC00bTcb09l" {
	cmd = getArgument();
	if (cmd=="Merge") {
		if (nSlices==1) {
		exit("only 1 channel detected");
		}
		Stack.getDisplayMode(mode);
		if (mode=="color" || mode=="grayscale") {
		t = getTitle();
		Stack.setDisplayMode("composite");
		run("Stack to RGB");
		selectWindow(t);
		Stack.setDisplayMode("color");
		} else {
		run("Stack to RGB");
		}
		run("Tile");
	} else if (cmd=="Colour") {
		// ne traite pas les RGB
		if (bitDepth()==24){exit("Original image is RGB. Unable to continue.");}
		if (!is("composite")) {exit("Use Make Composite first...");}
		Stack.setDisplayMode("color");
	} else if (cmd=="Composite") {
		// ne traite pas les RGB
		if (bitDepth()==24){exit("Original image is RGB. Unable to continue.");}
		if (!is("composite")) {exit("Use Make Composite first...");}
		Stack.setDisplayMode("composite");
	} else if (cmd=="Merge at end") {
		// ne traite pas les RGB
		if (bitDepth()==24){
		exit("Original image is RGB. Unable to continue.");
		}
		t = getTitle();
		Stack.setDisplayMode("composite");
		run("Duplicate...", "title=["+t+"2.tif] duplicate channels=1-"+nSlices);
		n = nSlices;
		selectWindow(t);
		run("Split Channels");
		selectWindow(t+"2.tif");
		run("Stack to RGB");
		selectWindow(t+"2.tif");
		close();
		run("Images to Stack", "name="+t+" merge title=["+t+"] use keep");
		selectWindow(t+"2.tif (RGB)");
		close();
		for (i=1; i<n+1; i++) {
		selectWindow("C"+i+"-"+t);
		close();
		}
		selectWindow(t);
	} else if (cmd=="Make Composite") {
		run("Make Composite", "display=Color");
	} else if (cmd!="-") run(cmd);
}

var bCmds = newMenu("Stack Menu Tool",
newArray("Add Slice", "Delete Slice", "Make Substack...", "Stack Splitter", "Set Slice...", 
		"-", "Animation Options...", "-", "Convert Images to Stack", "Convert Stack to Images", 
		"Z Project...",	"Make Montage...", "3D Project...", "Plot Z-axis Profile"));

macro "Stack Menu Tool - C037T0b11ST8b09tTcb09k" {
	cmd = getArgument();
	if (cmd!="-") run(cmd);
}

macro "Revert Action Tool - C037T0b11RT7b09eTcb09v" {
	run("Revert");
}

macro "Scale Action Tool - C037T0b11BT7b09aTcb09r" {
	requires("1.45f");
	getPixelSize(unit, pixelWidth, pixelHeight);
	if (unit=="pixels") {
		Dialog.create("Error");
		Dialog.addMessage("No calibration... Do it now?");
		Dialog.show();
		run("Properties...");
		getPixelSize(unit, pixelWidth, pixelHeight);
			while (unit=="pixels"){
				showMessage("Wrong calibration. Unit is still 'pixels'\nExample : write 'um' for microns in the field 'Unit of Length'.");
				run("Properties...");
				getPixelSize(unit, pixelWidth, pixelHeight);
			}
	}
	x = getWidth();
	y = getHeight();
	getPixelSize(unit, pixelWidth, pixelHeight);

	// calculation of optimal size for the scale bar
	// while loop: (xconv * factor) should be between 10 and 99
	xconv = x * pixelWidth;
	factor = 1;
	while (floor(xconv * factor) < 10) {
		factor = factor * 10;
	}
	while (floor(xconv * factor) >= 100) {
		factor = factor / 10;
	}
	xx = xconv * factor;
	if (xx < 15) {u = 1;}
	else if (xx < 35) {u = 2;}
	else if (xx < 80) {u = 5;}
	else {u = 10;}

	minlen = u / factor;
	setTool("rectangle");

	//conversion en pixels
	lenpx = minlen*2 / pixelWidth;

	// default location of scale bar in the lower right corner
	makeLine(x*0.9-lenpx,y*0.9,x*0.9,y*0.9);

	waitForUser("Scale Bar","2 - Move the yellow bar by its center.\n Click OK when done.");

	thick = floor(y/80);
	colorchoice = "White";

	run("Scale Bar...", "width="+minlen*2+" height="+thick+" font="+floor(y/30)+" color="+colorchoice+" background=None location=[At Selection] bold hide overlay");
	run("Select None");
	waitForUser("Scale Bar size","The size of this scale bar is "+minlen*2+" "+unit);
}
	
macro "-" {} //menu divider

macro "About Startup Macros..." {
	title = "About Startup Macros";
	text = "Macros, such as this one, contained in a file named\n"
		+ "'StartupMacros.txt', located in the 'macros' folder inside the\n"
		+ "Fiji folder, are automatically installed in the Plugins>Macros\n"
		+ "menu when Fiji starts.\n"
		+ "\n"
		+ "More information is available at:\n"
		+ "<http://imagej.nih.gov/ij/developer/macro/macros.html>";
	dummy = call("fiji.FijiTools.openEditor", title, text);
}
