# adapted from https://www.red-gate.com/simple-talk/blogs/powershell-script-all-objects-on-all-databases-to-files/

$path = “<path to destination folder>”    #Set inititial destination path
$ServerName = “<server name>”

[System.Reflection.Assembly]::LoadWithPartialName(‘Microsoft.SqlServer.SMO’)          #Load SMO Assembly - could add Out-Null to send the object to null and remove it from the pipeline
$serverInstance = New-Object (‘Microsoft.SqlServer.Management.Smo.Server’) $ServerName     #Declare a server object 
 
    $IncludeTypes = @(“tables”,”StoredProcedures”,”Views”,”UserDefinedFunctions”)     #Set an array using @() of items to include
    $ExcludeSchemas = @(“sys”,”Information_Schema”)

$dbs=$serverInstance.Databases   #Set databases

foreach ($db in $dbs)   #Loop through databases on server
{
       $dbname = “$db”.replace(“[“,””).replace(“]”,””)  #Remove [ and ] using replace
       $dbpath = “$path”+”$dbname” + “\”          #Append path with dbname

    if ( !(Test-Path $dbpath))                           #Check to see if path exists
           {$null=new-item -type directory -name “$dbname”-path “$path”}  #If path doesn't exist, create path with dbname

       foreach ($Type in $IncludeTypes)                #Loop through types   
       {
              $objpath = “$dbpath” + “$Type” + “\”     #Append path with dbname

         if ( !(Test-Path $objpath))                #Check to see if path exists
           {$null=new-item -type directory -name “$Type”-path “$dbpath”}   #If path doesn't exist, create path with type
              foreach ($objs in $db.$Type)     #Loop through objects in databases included types
              {
                     If ($ExcludeSchemas -notcontains $objs.Schema ) #Check to see if the object has an excluded schema name
                      {
                           $ObjName = “$objs”.replace(“[“,””).replace(“]”,””) #Remove [ and ] using replace                  
                           $OutFile = “$objpath” + “$ObjName” + “.sql”     #Create name of output file
                           $objs.Script()+”GO” | out-File $OutFile #script object 
                      }
              }
       }     
}
