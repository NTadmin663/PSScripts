######### Script to Merge AutoPilot Hardware Hash Multiple CSV Files #####

# Created NTAdmin #

# Owned By NT Admin #

#Parameters
$sourceFolder = "$PSscriptroot\"


Get-ChildItem -Path $PSscriptroot\AutopilotCSVMerged -Recurse | Remove-Item -force -recurse -EA SilentlyContinue
Remove-Item '$PSscriptroot\AutopilotCSVMerged' -force -EA SilentlyContinue


New-Item -Path "$PSscriptroot\AutopilotCSVMerged" -ItemType "Directory" -Force

$outputFile = "$PSscriptroot\AutopilotCSVMerged\AutopilotCSVsMerged.csv"
 
$SourceFiles = Get-ChildItem -Path $sourceFolder -Filter *.csv
 
$FirstFile = $true
ForEach ($File in $SourceFiles) {
    $Content = Get-Content $File.FullName
 
    if ($firstFile) {
        $content[0] | Add-Content $outputFile
        $firstFile = $false
    }
    $content | Select-Object -Skip 1 | Add-Content $outputFile
}