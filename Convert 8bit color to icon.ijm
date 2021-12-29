macro "Convert Image to Tool Icon..." {
  requires("1.35r");
  
  run("Duplicate...", "title=tmp-for-icon.tif");
  
  if (bitDepth!=8) run("8-bit Color", "number=256");
 
  if (getWidth != 16 || getHeight != 16) run("Scale...", "x=- y=- width=16 height=16 interpolation=None average create");
 
  Dialog.create("Image 2 Tool");
  // Dialog.addString("Tool name", "myTool");
  Dialog.addCheckbox("Transparent Color", true);
  Dialog.addChoice("Intensity to replace with transparent", newArray("Min", "Max"), "Max");
  Dialog.show();
  
  mytool = "";
  // mytool = Dialog.getString();
  transparent = Dialog.getCheckbox();
  transparentToReplace = Dialog.getChoice();
  
  getLut(r,g,b);
  getRawStatistics(area, mean, min, max);
  ts='macro "'+mytool+' Tool - ';
if (transparentToReplace=="Max") {transparentVal = max;} else {transparentVal = min;}
	
  for (i=0; i<=max; i++) {
      if (!(transparent && i==transparentVal)) {
          r2=floor(r[i]/256*16);
          g2=floor(g[i]/256*16);
          b2=floor(b[i]/256*16);
          color = "C"+toHex(r2)+toHex(g2)+toHex(b2);
          if (!endsWith(ts, color)) ts=ts+color;
          for (x=0; x<getWidth; x++) {
              for (y=0; y<getHeight; y++) {
                  if (getPixel(x,y)==i)
                      ts=ts+"D"+toHex(x)+toHex(y);
              }
          }
      }
  }
  print(ts);
  exit;
  
  // To write file
  macrodir = getDirectory("macros");
  if (!endsWith(mytool,".txt")) mytool = mytool+".txt";
  f = File.open(macrodir+mytool);
  ts=ts+'"{\n\n}';
  print(f, ts);
  File.close(f);
  open(macrodir+mytool);
}
