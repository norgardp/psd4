read_SegmentDirectory = function(dname, dets=NA, type)
{
	initial_directory = getwd();
	setwd(dname);

	# Determine if some or all detectors are to be included in the return list
	detectors = dir(pattern = "det[0-9]{2}.raw");
	if( (length(dets) > 1) & !any(is.na(dets)) )
	{
		desired_detectors = sapply(1:length(dets), function(i) sprintf("det%02d.raw", dets[i]));
		detectors = detectors[sapply(1:length(desired_detectors), function(i) grep(detectors, pattern=desired_detectors[i]))];
	}
	
	retval = list();
	retval[['segment']] = dname;
	retval = do.call(c, list(retval, lapply(1:length(detectors), function(i) read_DetectorData(detectors[i], type) )));

	setwd(initial_directory);
	return(retval);
}