corr <- function (directory, threshold=0)	{
	file_list <- list.files(directory, full.names=TRUE)	##create list of files
	corr_vector <- numeric()
	for (i in seq_along(file_list))  {
		dat <- read.csv(file_list[i])
		ok <- complete.cases(dat)		# vector of T/F
		ok_sum <- sum(ok[TRUE])			# count of valid cases
		dat_comb <- data.frame(dat,ok)		# combined
		dat_clean <- subset(dat_comb,ok==TRUE)	# subset valid cases
		dat_sulfate <- dat_clean[,2]			# vector of sulfate readings
		dat_nitrate <- dat_clean[,3]			# vector of nitrate readings
		if(ok_sum > threshold)	{			# if sufficient readings
			dat_cor <- cor(dat_sulfate,dat_nitrate)	# correlation
			corr_vector <- c(corr_vector,dat_cor)	# add for correlation vector
		}	else	{
			dat_cor <- 0
		}
# print(i)
# print(ok_sum)
# print(dat_cor)
	}
# print(corr_vector)
	return (corr_vector)
}