Get-ChildItem C:\Users\Connor\Desktop\Kids\*.jpg | Rename-Item -newname {$_.CreationTime.toString("dd.MM.yyyy.HH.mm") + ".jpg"}
