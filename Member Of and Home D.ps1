import-module activedirectory
$name = Read-Host -Prompt "Existing User?"
$name2 = Read-Host -Prompt "New User?"
$name3 = $name2.substring(0,1)
$name4 = $name2 -replace '[.]',''
Get-ADPrincipalGroupMembership -Identity $name | % {Add-ADPrincipalGroupMembership -Identity $name2 -MemberOf $_}
Set-ADUser -Identity $name2 -HomeDirectory \\filestore\Users\$name3\$name4 -HomeDrive H
New-Item \\filestore\Users\$name3\$name4 -type directory