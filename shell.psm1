

function new-shell{
	param($path)
	if(test-path $path){
	write-error "error $path already exist"}
	else{
		md $path
		md $Path\asset
		md $path\public
		new-item $path\profile.ps1
	}

function new-note{

param($name)
	}
