

foreach ($file in Get-ChildItem  "Public") {
    
    . $file.FullName
  }
  
  function ezshell {
    wt -p ezpwsh $PSScriptRoot\public\ezshell\profile.ps1
    
  }
  function noteshell {
  wt -p ezpwsh $PSScriptRoot\public\noteshell\profile.ps1
    
  }