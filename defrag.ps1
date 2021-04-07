 $Computers = Get-Content -Path \\server\share\computers.txt
foreach ($computer in $computers){

    Invoke-Command -ScriptBlock { $out= defrag c: /A | Select-String -Pattern "Total" |  
    Add-Content -Path "C:\XY\$env:COMPUTERNAME.csv" -Value "$env:COMPUTERNAME;$out" } -ComputerName $computer
    Move-Item -Path "\\$computer\c$\XY\$computer.csv" -Destination \\server\share\input\
} 
