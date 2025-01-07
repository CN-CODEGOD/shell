BeforeAll{
    function upscrollDisk {
        $disksqueue=New-Object System.Collections.Generic.Queue[object]
        (Get-PSDrive).Root | ForEach-Object {
            $disksqueue.Enqueue($_)
        }
        $currentdisk=($pwd.Drive).Root

        do {
            $previousDisk=$Inque
            $Inque= $disksqueue.Dequeue()
        } until (
            $Inque -eq $currentdisk
        )
        Set-Location $previousDisk
    }

    function downscrolldisk {
        $disksqueue=New-Object System.Collections.Generic.Queue[object]
        (Get-PSDrive).Root | ForEach-Object {
            $disksqueue.Enqueue($_)
        }
        $currentdisk=($pwd.Drive).Root

        do {
            $deque=$disksqueue.Dequeue()
        } while (
            $deque -ne $currentdisk
        )
        $nextdisk=$disksqueue.Dequeue()
        Set-Location $nextdisk
    }
}
Describe "test" {
    context "test downscrolldisk" {
        it "test first Disk when scroll"{
            Set-Location c:
            downscrollDisk

            (($Pwd).Drive).Root | should -be d:\
        }

        it "test the last disk when scroll"{
            Set-Location WSMan:\
            downscrollDisk
            (($pwd.Drive)).Root | Should -be c:   
        }
    }
    context 'debuging'{
        it 'debug scrollupdisk'{
            Set-Location d:\
            $disksqueue=New-Object System.Collections.Generic.Queue[object]
            (Get-PSDrive).Root | ForEach-Object {
                $disksqueue.Enqueue($_)
            }
            do {
                $previousDisk=$Inque
                $Inque= $disksqueue.Dequeue()
            } until (
                $Inque -eq (($pwd).Drive).Root
            )
            Set-Location $previousDisk
            $previousDisk | Should -be c:\
            $pwd.Drive.Root | Should -be c:\
        }
    }
}