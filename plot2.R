#read----
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#----
BaltimoreData <- NEI[NEI$fips == "24510", ]
totalEmissionsBaltimore <- aggregate(BaltimoreData$Emissions, list(BaltimoreData$year), FUN = "sum")
png(filename = "Plot2.png", width = 480, height = 480, units = "px")
plot(totalEmissionsBaltimore, type = "b", pch = 20, col = "blue", 
     xlab = "Year", 
     main = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"), 
     ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()