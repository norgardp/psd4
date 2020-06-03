read_DetectorData = function(dvalue, type)
{
	retval = list();
	retval[['name']] = dvalue;
	retval[['type']] = type;
	
	if(type == "pos")
	{
		retval = do.call(c, list(retval, read_DetectorPositionData(dvalue)));
		
	} else if(type == "ab")
	{
		retval = do.call(c, list(retval, read_DetectorAmplifierData(dvalue)));

	} else if(type == "sum")
	{
		retval = do.call(c, list(retval, read_DetectorSummationData(dvalue)));
		
	} else
	{
		print("Error in function read_DetectorData(): invalid type specified");
		retval = -1;
	}

	return(retval);
}