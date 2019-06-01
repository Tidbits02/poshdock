class DockerContainer {
    [string] $ContainerName
    
    Container([string] $ContainerName) {
        $this.ContainerName = $ContainerName
    }

    [void] MyName() {
        write-host $this.ContainerName
    }
}