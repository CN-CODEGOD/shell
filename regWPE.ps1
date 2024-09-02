
class path {
    [string]$path
    path([string]$path){
        if (test-path $path) {
            $this.path=$path
        }
   else {
    
throw "路径不正确"
   }
    }
}
function Rgewpe {
  [CmdletBinding()]
  param (
      [Parameter(Mandatory)]
      [path]
      $path
  )
  $filepath = $path.path
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\hide icons" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\hide icons\command" /f /ve /d "$filepath -control hideIcons"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\show icons" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\show icons\command" /f /ve /d "$filepath -control showIcons"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\暂停壁纸" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\暂停壁纸\command" /f /ve /d "$filepath -control pause"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\打开壁纸" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\打开壁纸\command" /f /ve /d "$filepath -control play"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mute" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\mute\command" /f /ve /d "$filepath -control mute"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\unmute" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\unmute\command" /f /ve /d  "$filepath -control unmute"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\关闭壁纸" /f /v icon /d $filepath  
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\关闭壁纸\command" /f /ve /d "$filePATH -control stop"
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\打开WPE" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\打开WPE\command" /f /ve /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\NEXT_wallpaper" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\Directory\Background\shell\NEXT_wallpaper\command" /f /ve /d "$filepath -control nextWallpaper"
  reg add "HKEY_CLASSES_ROOT\*\shell\打开为壁纸" /f /v icon /d $filepath
  reg add "HKEY_CLASSES_ROOT\*\shell\打开为壁纸\command"  /f /ve /d "$filepath -control openWallpaper -file `"%1"""
  
  
}
RGEwpe