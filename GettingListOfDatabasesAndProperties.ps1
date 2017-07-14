ForEach ($instance in Get-Content "<Enter the path to a text file that lists instances>")
{
     $s = New-Object ('Microsoft.SqlServer.Management.Smo.Server') $instance 
     $dbs=$s.Databases       
     $dbs | SELECT Name, Collation, CompatibilityLevel, AutoShrink, RecoveryModel, Size, SpaceAvailable, Owner |

Out-File <Enter the path to a csv output>    #PowerShell will automatically create a csv with the name you give it here
Notepad <Enter the path to a csv output>  }  #This path should be the same as the Out-File path 
