pollutantmean <- function (directory, pollutant, id=1:332)	{
	file_list <- list.files(directory, full.names=TRUE)	##create list of files
	if(pollutant == "sulfate") {
		col_id = 2
	}
	else if (pollutant == "nitrate")  {
		col_id = 3
	}
	dat <- data.frame()			## create empty data frame
#	for (i in id)  {
#	dat <- rbind(dat, read.csv(file_list[i]))  ## aggregrate data
#	}
	tmp <- vector(mode="list",length=length(file_list)) ## create empty vector
	for (i in seq_along(file_list))  {
	tmp[i] <- read.csv(file_list[[i]])		## aggregrate data
	}
	dat_out <- do.call(rbind,tmp)			## convert tmp list to data frame
	mean(dat_out[,col_id],na.rm=TRUE)		## mean of pollutant
}