New-Module -Name EnvSetup -ScriptBlock {
    # Install nuget
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    $targetNugetExe = ".\nuget.exe"
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
    
    echo $env:DotFeedUri
    
    Set-Alias nuget $targetNugetExe -Verbose
    
    # Add DotFeed as source
    Write-Host "We are the best!!!!! :)"
    
    Write-Output nuget sources list -verbosity detailed
    Write-Output nuget list source -verbosity detailed
    
    Write-Host "========== Adding feed now ==========="
    
    Write-Output nuget sources add -Name DotFeed -Source $env:DotFeedUri -username buildAgent -password $env:DotFeedPassword -Verbosity Detailed
    Write-Output nuget list source -verbosity detailed
    Write-Output nuget sources list
}
