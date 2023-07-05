#read----
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#----
# Subset the data for the years 1999, 2002, 2005, and 2008
years <- c(1999, 2002, 2005, 2008)
emissions <- sapply(years, function(year) sum(NEI$Emissions[NEI$year == year]))
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
# Create a bar plot of the total PM2.5 emissions for each year
plot(emissions ~ years,type = 'l',
        xlab = "Year", ylab = expression("Total PM"[2.5]*"Emissions(in tons)"),
        main = expression("Total PM"[2.5]*"Emissions in the US from 1999 to 2008"))
points(years, emissions, pch = 16, col = "red")
dev.off()