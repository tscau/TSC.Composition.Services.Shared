$rev = $env:GITHUB_RUN_NUMBER
Write-Host "rev number is " $rev

$branch = $env:GITHUB_REF;


Write-Host "::set-env name=fa_name::$($fa.name)"

if($branch -like '*feature*'){
    #get the branch name from the last / 
    $featureName = $branch.Substring($branch.LastIndexOf('/')+1)
    $ver = -join("1.0.", $featureName, ".", $rev)
    Write-Host "::set-env name=NUGET_VERSION::$($ver)"
    #$env:NUGET_VERSION = $ver
} else {
    $ver = -join("1.0.", $rev)
    Write-Host "::set-env name=NUGET_VERSION::$($ver)"
}
