function Get-ContainerObject {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$False)]
        [string[]]$flags
    )
    process {
        $ContainersFromApi = @()
        $DockerApiUrl = "http://127.0.0.1:2376/containers/json"
        foreach ($flag in $flags) {
            switch ($flag) {
                "all" {
                    $DockerApiUrl = "{0}{1}" -f $DockerApiUrl,"?all=true"
                    break
                }
            }
        }
        $Containers = invoke-restmethod -Uri $DockerApiUrl
        foreach ($Container in $Containers) {
            $ContainersFromApi += [DockerContainer]::new($Container)
        }
        return $ContainersFromApi
    }
}