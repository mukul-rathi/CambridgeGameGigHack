function getTime()
	local timeList = os.time
	return timeList[4]*3600 + timeList[5]*60 + timeList[6]
end