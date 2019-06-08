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
        $uri = "http://127.0.0.1:2376/containers/{0}/stop" -f $this.Id
        Invoke-RestMethod -Uri $uri -Method Post
        $this.Update() # Updated container info in object
    }
    
    [void] Start() {
        $uri = "http://127.0.0.1:2376/containers/{0}/start" -f $this.Id
        Invoke-RestMethod -Uri $uri -Method Post
        $this.Update() # Updated container info in object
    }
    
    [void] Pause() {
        write-host "Method not yet implemented"
    }
    
    [void] Remove() {
        write-host "Method not yet implemented"
    }

    [void] Update() {
        $uri = "http://127.0.0.1:2376/containers/{0}/json" -f $this.Id
        $UpdatedJson = Invoke-RestMethod -Uri $uri -Method Post
        $this.State = $UpdatedJson.State.Status
    }
}