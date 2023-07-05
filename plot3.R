#read----
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#----
library(plyr)
library(ggplot2)
BaltimoreData <- NEI[NEI$fips == "24510", ]
Emissions_sum <- aggregate(Emissions ~ type + year, data = BaltimoreData, sum)
png(filename = "Plot3.png", width = 480, height = 480, units = "px")
ggplot(Emissions_sum, aes(x = year, y = Emissions, group = type, color = type)) + 
        geom_line() + 
        geom_point() + 
        labs(title = expression('Total PM'[2.5]*" Emissions in Baltimore City, Maryland from 1999 to 2008"), 
                xlab = "Year", 
                ylab = expression('Total PM'[2.5]*" Emission (in tons)"))
dev.off()