complete <- function(directory, id = 1:332) {
	
	setwd(file.path(getwd(),directory))
	temp <- list.files()
	nx <- NULL
		
	for (i in id) {
		poldata <- read.csv(temp[i])
		pgood <- complete.cases(poldata)
		poll_obs <- data.frame("id" = i, "nobs" = nrow(poldata[pgood,]))
		nx <- rbind(nx,poll_obs)
	}

	setwd("..")
	return (nx)
}
