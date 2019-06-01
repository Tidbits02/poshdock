function Get-DockerContainer {
    [CmdletBinding()]
    Param(
        [switch]$GetAll
    )
    process {
        $flags = @()
        if ($GetAll -eq $True){
            $flags += "all"
        }
        if ($flags.length -ne 0) {
            return Get-ContainerObject -flags $flags 
        } else {
            return Get-ContainerObject
        }
    }
}