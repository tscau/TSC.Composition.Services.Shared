$rev = $env:GITHUB_RUN_NUMBER
Write-Host "rev number is " $rev

$branch = $env:GITHUB_REF;

if($branch -like '*feature*'){
    #get the branch name from the last / 
    $featureName = $branch.Substring($branch.LastIndexOf('/')+1)
    $ver = -join("1.0.", $featureName, $rev
    $env:NUGET_VERSION = $ver
} else {
    $env:NUGET_VERSION = -join("1.0.", $rev)
}
