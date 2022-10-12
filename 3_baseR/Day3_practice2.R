#1. Use readRDS() to load in an object called
#/t1-data/project/obds/shared/resources/2_r/my_day2matrix.rds
my_day2matrix_AE <- readRDS("/t1-data/project/obds/shared/resources/2_r/my_day2matrix.rds")
head(my_day2matrix_AE)
dim(my_day2matrix_AE)

#2. Add row sums and means to this dataset
my_day2matrix_AE_1 <- cbind(my_day2matrix_AE, rowSums(my_day2matrix_AE), 
                          rowMeans(my_day2matrix_AE))
dim(my_day2matrix_AE_1)
head(my_day2matrix_AE_1)

#Add column sums and means - call new matrix file with 2 additional columns but ask for
#rowsums and rowmeans to be done on original matrix

my_day2matrix_AE_2 <- rbind(my_day2matrix_AE_1, c(colSums(my_day2matrix_AE), NA, NA),
                                              c(colMeans(my_day2matrix_AE), NA, NA))
head(my_day2matrix_AE_2)
dim(my_day2matrix_AE_2)
print(my_day2matrix_AE_2)

#3. Load the ToothGrowth datset using data(ToothGrowth)
data("ToothGrowth")

#4. How do find more information on this dataset? - check help menu
 # 5. What columns of data do we have?
colnames(ToothGrowth)
dim(ToothGrowth)
head(ToothGrowth)

#6. What is the mean tooth length?
mean(ToothGrowth$len)

#7. What is the maximum and minimum weight of the tooth length?
max(ToothGrowth$len)
min(ToothGrowth$len)

#8. Can you calculate rowSums and rowMeans on this data? - no, column containing string/character

########################################################
#1. Load the airquality dataset.
data("airquality")

#2. Look up more information about this dataset. Check in help in bottom right window
#3. Examine the dataset – how many rows and columns are there?
dim(airquality)
head(airquality)

#4. Display the column headers.
colnames(airquality)

#5. Sort the dataframe by the first column (Ozone) in ascending order.
airquality2 <- airquality[order(airquality$Ozone), ]
head(airquality2)

#6. Sort the dataframe by the Month and then the Temp column in descending order and save to a new variable.
airquality3 <- airquality[order(airquality$Month, airquality$Temp, 
                               decreasing = T),]
head(airquality3)

#7. Save this sorted data to a file on the server. quote=FALSE can be added to prevent quotes going round any characters/strings
write.table(airquality3, 'ordered_air_quality_by_month_temp', sep=',', quote = FALSE, row.names = FALSE)

###################################################################
#Create the dataframes called buildings and data to merge:

buildings <- data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))
data <- data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1),
                   efficiency=c(51,64,70,71,80,58))
dim(buildings)
dim(data)

#What is the common key variable in these dataframes? location
#Use the merge() function to merge the two dataframes by the common key variable into a new dataframe called buildingStats.
buildingStats <- merge(x=buildings, y=data, by='location', all=T)
head(buildingStats)

###################################################################################
#Aggregate (or group) the airquality data by Month and return means on each of the numeric variables. Also, remove “NA” values.
#also renames first column as Months
agg_month = aggregate(airquality, 
                      by=list(Months=airquality$Month), 
                      FUN=mean, na.rm=T)
agg_month

#Aggregate the Solar.R column by Month, returning means of Solar.R The header of column 1 should be Month. Remove “not available” values.
agg_solar = aggregate(airquality$Solar.R, 
                       by=list(Months=airquality$Month), 
                       FUN = mean, 
                       na.rm=T)
agg_solar
names(agg_solar)[names(agg_solar) == "x"] <- "Solar.R"
agg_solar

#Can get rid of x as header of column using the following formula
agg_noX = aggregate(Solar.R~Month, airquality,FUN=mean,na.rm=T)
agg_noX

#3. Apply the standard deviation function to the data aggregation you have just done.
agg_solar_sd = aggregate(airquality$Solar.R, 
                      by=list(Months=airquality$Month), 
                      FUN = sd, 
                      na.rm=T)
agg_solar_sd

####################################################################
#Write a function to calculate the hypotenuse of a triangle given the length of the 2 sides.
#Remember the hypotenuse is the square root of the sum of the squares - √(a² + b²) 
#Run the function you have created with different values.
#can put the function all on one line by using a semi-colon ; between the first and second lines of the function

calc_hypotenuse <- function(a=NULL, b=NULL) {
  hypotenuse <- sqrt((a^2)+(b^2))
  return(hypotenuse)
  }
calc_hypotenuse(3,4)

###################################################################################
#1. Write a for loop that iterates over the numbers 1 to 7 and prints the cube of each number using print().

for(i in c(1:7)){
  print(i^3)
}

#2. Write a for loop that iterates over the column names of the inbuilt iris 
#dataset and print each together with the number of characters
#in the column name in parenthesis. Example output: Sepal.Length (12).
#Use the functions print(), paste0() and nchar(). Look up what these functions do using the help feature.
iris
colnames(iris)
length <- length(colnames(iris))
length
iris_cols <- colnames(iris)


for(colu in colnames(iris)){
print(paste0(colu, nchar(colu))) #colu represents the columnnames in this loop. Use past0 to concantenate 2 variables
}

#3. Write an ifelse loop to print the colours in colours_vector with four characters.
#Use nchar() colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")

colours_vector <- c("red", "orange", "purple", "yellow", "pink", "blue")
four <- ifelse(nchar(colours_vector) == 4, colours_vector , "not4letters")
print(four)


########################################################################################
#Exercise 7 - apply
#1. Create a numeric vector of length 10. Write an lapply and sapply statement to square each element. Compare the two outputs.

numeric_vector <- c(1:10) #creating the numeric vector
numeric_vector

lapply(numeric_vector, function(x) x ^ 2) #creating a function which will square each element of the list

sapply(numeric_vector, function(x) x ^ 2)

#2. Generate a list of length 4 containing both numeric and logical (T/F) vectors. Write an lapply or sapply statement to calculate the sum of
#the elements in each vector.

list_four <- list(8, 24, TRUE, FALSE)
list_four

lapply(list_four, sum)
sapply(list_four, sum)

#3. Write a sapply statement to repeat each element of each vector in your list three times e.g. 1, 4, 3 would become 1, 1, 1, 4, 4, 4, 3, 3, 3.
#Assign the output to a new list.

numeric_vector_triple <- list(sapply(numeric_vector, function(i) rep(i, each=3)))
typeof(numeric_vector_triple)
numeric_vector_triple

