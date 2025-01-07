using namespace Microsoft.PowerShell
pwsh
#set env:
$dashboardpath ="$PSScriptRoot\dashboard.js"

function consoleFileOpener {
    
    get-childitem -path $pwd `
    | out-consolegridview -OutputMode Single `
    | ForEach-Object {
        if ($_.PSIsContainer) {
            consoleFileOpener -path $_.fullname
        } else {
            start-process $_.fullname
        }  
    }
}
function scrollDisk {
 
}
function consoleProcessKiler { Get-Process | Out-ConsoleGridView -OutputMode Single -Filter $args[0] | Stop-Process -Id {$_.Id} }

function consoleDiskSelect {
   Get-PSDrive|Where-Object $_.root -ne $null    
   Out-ConsoleGridView -OutputMode Single ` 
   |%{
    cd $_.root  
   }
}

$parameters=@{
    chord =tab
    BriefDescription="tab menu"
    Description="dashboard menu with blessed-contrib"
    ScriptBlock={
[PSConsoleReadLine]::reverline();
[PSConsoleReadLine]::Insert(" node $dashboardpath");
[PSConsoleReadLine]::AcceptLine()

    }

}
Set-PSReadLineKeyHandler @parameters
$parameters=@{
    chord=ctrl+f
    BriefDescription="fileopener"
    scriptblock={
        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::Insert("consoleFileOpener");
        [PSConsoleReadLine]::AcceptLine()
    }
    
}

Set-PSReadLineKeyHandler @parameters

$parameters=@{
    chord =ctrl+w
    BriefDescription="kill process"
    Description="stop-process use by consolegui"

    scriptblock ={
        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::insert("consoleProcessKiler");
        [PSConsoleReadLine]::AcceptLine();

    }
}

$parameters=@{
    chord=uparrow
    BriefDescription="change disk"
    Description="change disk to another"
    scriptblock={
        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::Insert();
        [PSConsoleReadLine]::AcceptLine()
    }
}
Set-PSReadLineKeyHandler @parameters

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

$parameters = @{
    chord=rightarrow
    BriefDescription="enter folder"
    Description="cd folder with consolegui"
    scriptblock={

        [PSConsoleReadLine]::reverline();
        [PSConsoleReadLine]::Insert("consoleFolderSelector")
        [PSConsoleReadLine]::AcceptLine()
    }
}
#
