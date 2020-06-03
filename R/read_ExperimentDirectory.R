read_ExperimentDirectory = function(dname, dets, type)
{
	initial_directory = getwd();
	setwd(dname);
	
	scan_directories = dir(pattern = "Scan[0-9]{2}");
	retval = list();
	retval[['experiment']] = dname;
	retval = do.call(c, list(retval, lapply(1:length(scan_directories), function(i) read_ScanDirectory(scan_directories[i], dets, type) )));
	
	setwd(initial_directory);
	return(retval);
}