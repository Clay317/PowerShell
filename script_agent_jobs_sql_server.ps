# Get list of sql servers to check. List server names in a text file. 
	$sqlservers = Get-Content "<add path to text file here>";
	 
# Loop through each sql server from sqlservers.txt
	foreach($sqlserver in $sqlservers)
	 
	     {
# Create an SMO Server object
	      $srv = New-Object "Microsoft.SqlServer.Management.Smo.Server" $sqlserver;
	 	 
# For each jobs on the server
	      foreach($job in $srv.JobServer.Jobs)
	 
	      {
	            $jobName = $job.Name;
                    $jobEnabled = $job.IsEnabled;
	            $jobLastRunOutcome = $job.LastRunOutcome;
	            $jobNameFile = "<add path for out-file here>" + $sqlserver.replace("\","-") + "\" + $jobName +".sql"
	 
	        $job | foreach {$_.Script()} | out-file $jobNameFile
	        
	      }
	     
	}
