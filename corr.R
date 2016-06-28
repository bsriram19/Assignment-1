corr <- function(directory, threshold = 0) {
	
	pobs <- complete(directory, id = 1:332)

	setwd(file.path(getwd(),directory))
	temp <- list.files() 
	pol_cor <- 0
	j <- 0

	for (i in 1:332) {
		if (pobs[i,2] > threshold) {
			j <- j + 1
			poldata	<- read.csv(temp[i])
			pgood <- complete.cases(poldata)
			pol_th <- poldata[pgood,]
			pol_cor[j] <- cor(pol_th$sulfate,pol_th$nitrate)
		}
	}
	setwd("..")
	return (pol_cor)
}
