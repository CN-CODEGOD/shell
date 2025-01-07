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

Set-PSReadLineKeyHandler @parameters
