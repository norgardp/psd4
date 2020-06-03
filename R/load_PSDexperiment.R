LoadPSDExperiment = function(numeric_range, dets=NA, type)
{
	# Construct directory names from numeric input values and call function to
	# read inside the directory
	dnames = sapply(1:length(numeric_range), function(i) sprintf("Expt%05d", numeric_range[i]));
	retval = lapply(1:length(dnames), function(i) read_ExperimentDirectory(dnames[i], dets, type));
	return(retval);
}