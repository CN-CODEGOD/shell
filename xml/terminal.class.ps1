using namespace System.Xml.Linq
class cmd {
    [scriptblock]$scriptblock
    [string]$name
    [void] DoInit(    [pscustomobject]$pscustomobject){
        $pscustomobjectName= (($pscustomobject)|Get-Member -Type NoteProperty ).Name
        foreach($propertyName in $pscustomobjectName ){ 
    
           $this.$Propertyname= $pscustomobject.$Propertyname
        }
    }
    
    script ($pscustomobject){
    $this.doinit($pscustomobject)
    }
        
    [object] save(){
    
        $object=[XElement]::new("object",
        [XAttribute]::new("type","testinstance"),
        [XElement]::new("property",[XAttribute]::new("name","txt"),$this.txt),
        [XElement]::new("property",[XAttribute]::new("name","name"),$this.name)
    
        )
        return $object.ToString()   
    }
    


}
class Terminal {
    [cmd]$cmd
    hidden[string]$path
    [string]$profilePath
    [string]$themePath
    
}