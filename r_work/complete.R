complete <- function (directory, id=1:332)	{
	file_list <- list.files(directory, full.names=TRUE)	##create list of files
	nobs <- numeric()
	id_num <- numeric()
	for (i in id)  {
		ok <- complete.cases(read.csv(file_list[i]))
		ok_sum <- sum(ok[TRUE])
		nobs <- c(nobs,ok_sum)
		id_num <- c(id_num,i)
#		print (i)
#		print (id_num[i])
#		print(nobs[i])
	}
	id_num <- id_num[!is.na(id_num)]		# remove NA if needed
	nobs <- nobs[!is.na(nobs)]			# remove NA if needed
	dat_final <- data.frame(id_num, nobs)
	return (dat_final)
}