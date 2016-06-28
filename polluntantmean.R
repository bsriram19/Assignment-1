pollutantmean <- function(directory, pollutant, id = 1:332) {
	
	setwd(file.path(getwd(),directory))
	temp <- list.files()
	total_pol <- 0
	total_pol_count <- 0
	x <- NULL
	
	for (i in id) {
		poldata <- read.csv(temp[i])
		pgood <- complete.cases(poldata)
		poll_all <- poldata[pgood,]
		x <- rbind(x,poll_all)
	}
	
	if (pollutant == "sulfate") {
	total_pol = total_pol + sum(x$sulfate)
	} else if (pollutant == "nitrate") {
	total_pol = total_pol + sum(x$nitrate)
	}

	total_pol_count = total_pol_count + nrow(x)

	setwd("..")

	return (total_pol/total_pol_count)
}
