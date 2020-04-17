Select-String -Path "<Enter the path to the folder you want to search>" -Pattern "<Enter pattern>" -List | select Path |

Out-File <Enter output path and file name here>  #PowerShell will automatically create a file with the name specified here

Notepad <Enter output path and file name here>   #Same as Out-File
