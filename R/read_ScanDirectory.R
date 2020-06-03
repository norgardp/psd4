read_ScanDirectory = function(dname, dets=NA, type)
{
	initial_directory = getwd();
	setwd(dname);
	
	segment_directories = dir(pattern = "Seg[0-9]{2}");
	retval = list();
	retval[['scan']] = dname;
	retval = do.call(c, list(retval, lapply(1:length(segment_directories), function(i) read_SegmentDirectory(segment_directories[i], dets, type) )));
	
	setwd(initial_directory);
	return(retval);
}