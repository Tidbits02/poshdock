function Get-ContainerObject {
    $Containers = invoke-restmethod -Uri "http://127.0.0.1:2376/containers/json"
    foreach ($Container in $Containers) {
        write-host $Container.State
        #return [DockerContainer]::new($Container.Names)
    }
}