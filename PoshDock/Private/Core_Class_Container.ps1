class DockerContainer {
    [String] $State
    [String] $Command
    [String] $Id
    [String[]] $Names
    [String] $Image
    [String] $ImageId
    
    DockerContainer([PSCustomObject] $ContainerRaw) {
        $this.State = $ContainerRaw.State
        $this.Command = $ContainerRaw.Command
        $this.Names = $ContainerRaw.Names
        $this.Id = $ContainerRaw.Id
        $this.Image = $ContainerRaw.Image
        $this.ImageId = $ContainerRaw.ImageId
    }

    [void] Stop() {
        write-host "Method not yet implemented"
    }
    
    [void] Start() {
        write-host "Method not yet implemented"
    }
    
    [void] Pause() {
        write-host "Method not yet implemented"
    }
    
    [void] Remove() {
        write-host "Method not yet implemented"
    }
}