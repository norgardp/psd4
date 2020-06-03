read_DetectorPositionData = function(dvalue)
{
	local_data = read.table(dvalue, header=FALSE, skip=9);
	
	retval = list();
	retval[['data']]= cbind(local_data[,1], local_data[,5]);
	return(retval);
}