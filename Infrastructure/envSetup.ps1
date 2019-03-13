New-Module -Name EnvSetup -ScriptBlock {
    # Install nuget
    $sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
    $targetNugetExe = ".\nuget.exe"
    Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
    
    echo $env:DotFeedUri
    
    Set-Alias nuget $targetNugetExe -Verbose
    
    # Add DotFeed as source
    Write-Host "========== Adding feed now ==========="
    
    Write-Host (nuget sources add -Name DotFeed -Source $env:DotFeedUri -username buildAgent -password $env:DotFeedPassword -Verbosity Detailed)
    # Write-Output (nuget list source -verbosity detailed)
    Write-Host (nuget sources list -Name DotFeed)
}
