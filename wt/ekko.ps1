function consoleFilegrid {
    param($path)
    get-childitem -path $path `
    | out-consolegridview -OutputMode Single `
    | ForEach-Object {
        if ($_.PSIsContainer) {
            consoleFileOpener -path $_.fullname
        } else {
            start-process $_.fullname
        
        }  
    }
    consoleFilegrid $Path
}
consolefilegrid -path D:\ekko