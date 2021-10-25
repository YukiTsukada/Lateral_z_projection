showMessage("Select Open Folder");
openDir = getDirectory("Choose a Directory");
list = getFileList(openDir);
showMessage("Select Save Folder");
saveDir = getDirectory("Choose a Directory");
for (i=0; i<list.length;i++){
    open(openDir+list[i]);
    n = getTitle();

    ImageY = getHeight();
    ImageX = getWidth();
    run("Orthogonal Views");
    
    for (j = 0; j < ImageX; j++) {
    	selectWindow(n);
	Stack.setOrthoViews(j, 0, 1);
	selectWindow("YZ "+ j);
	run("Duplicate..."," ");	
    }	
    Stack.stopOrthoViews;
    selectWindow(n);
    close();
    run("Images to Stack", "name=Stack title=[] use");
    saveAs("Tiff", saveDir+"latX"+i);
    close();
    
    open(openDir+list[i]);
    n = getTitle();

    ImageY = getHeight();
    ImageX = getWidth();
    run("Orthogonal Views");
    for (k = 0; k < ImageY; k++) {
    	selectWindow(n);
	Stack.setOrthoViews(0, k, 1);
	selectWindow("XZ "+ k);
	run("Duplicate..."," ");	
    }	
    Stack.stopOrthoViews;
    selectWindow(n);
    close();
    run("Images to Stack", "name=Stack title=[] use");
    saveAs("Tiff", saveDir+"latY"+i);
    close();
};