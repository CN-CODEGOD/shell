function consoleDiskSelect {
    Get-PSDrive|Where-Object $_.root -ne $null    
    Out-ConsoleGridView -OutputMode Single ` 
    |%{
     cd $_.root  
    }
 }

 
$parameters=@{
    chord=downarrow
    BriefDescription="select disk"
    Description="select disk in consolegui"
    scriptblock={
        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::insert("consoleDiskSelect");
        [PSConsoleReadLine]::AcceptLine()
    }


}
Set-PSReadLineKeyHandler @parameters
$parameters=@{
    chord=leftarrow
    BriefDescription="exit folder"
    Description="cd to the parent folder"
    scriptblock={
        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::insert("cd ..");
        [PSConsoleReadLine]::AcceptLine();

    }
    
}

Set-PSReadLineKeyHandler @parameters