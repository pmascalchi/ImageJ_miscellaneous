macro "Convert Icon to Image..." {
  requires("1.35r");
  
  code = getString("Input the code for the icon: ", "");

  // Parsing code
  newCode = replace(code, "C", "xC");
  eachColor = split(newCode, "x");
  
  newImage("Icon", "RGB white", 16, 16, 1);
  
  for (c=0; c<eachColor.length; c++) {
	// Get color as hexadecimal string
	rColor = substring(eachColor[c], 1, 2);
	gColor = substring(eachColor[c], 2, 3);
	bColor = substring(eachColor[c], 3, 4);
    rgbHexColor = Color.toString(convertHexToNumber(rColor), convertHexToNumber(gColor), convertHexToNumber(bColor));
	
    // Set drawing color
    Color.set(rgbHexColor);
	
    // Collect pixel positions
    positionCode = split(eachColor[c], "D");
	
	// Color pixels
	for (p=1; p<positionCode.length; p++) {
	  xPos = parseInt(substring(positionCode[p], 0, 1), 16);
	  yPos = parseInt(substring(positionCode[p], 1, 2), 16);
	  
	  fillRect(xPos, yPos, 1, 1);
	}
  
}

function convertHexToNumber(hexText) {
	nb16 = parseInt(hexText, 16);
	nb256 = (nb16 + 1) * 16 - 1;
	return nb256;
}