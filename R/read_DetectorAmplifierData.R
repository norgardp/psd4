read_DetectorAmplifierData = function(dvalue)
{
	local_data = read.table(dvalue, header=FALSE, skip=9);
	
	retval = list();
	retval[['data']]= cbind(cbind(local_data[,1], local_data[,2]), local_data[,3]);
	return(retval);
}

