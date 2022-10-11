a <- c(1:200); a              #create vector a, ; allows to separate commands
b <- (a * 123); b             # create vector b which is vector a multiplied by 123
b[44]                         #pull out index 44 from the vector
b_sub <- b[1:15]; b_sub       #create a vector called b_sub which contains first 15 elements of b
b_sub <- c(b_sub, 24108, 24231); b_sub #add two numbers to vector b_sub

vector1 <- c('actb', 100, 3.4); vector1 #create vector with string and numbers
vector1[2]                              #extract the second element of vector1, unable to use this index as an integer as it is coded as a string due to mixed classes in the list

char <- c(car=c('honda','toyota'), flower='tulip', person='diane'); char #character vector created called char containing 4 characters with an attribute assigned to each
names(char)                   #look at attributes or names of characters within vector. Note the car name is car1 and car2
attributes(char)              #can also use attributes function to see attributes or names
char[names(char) == ("flower")] #pull out the character(s) that has attribute flower

x <- matrix(1:9, nrow = 3); x #create a matrix filled with numbers 1-9, structure 3x3
x[2,3]
y <- matrix(1:12, nrow = 3, byrow = T); y #create a matrix with numbers 1-12, fill by rows
colnames(y) <- c("first", "second", "third", "fourth"); y #add column names to matrix y
row.names(y) <- c("first_row", "second_row", "third_row"); y #add row names to matrix y

myarray <- array(1:24, dim = c(4,2,3)); myarray #created an array called myarray with dimensions 4,2,3 with numbers 1 to 24
myarray[3,2,2]                                  #extract number 15
last_matrix <- myarray[,,3]; last_matrix

my_list <- list(y, 24, 'cow', last_matrix, TRUE); my_list #create a list with multiple different types of objects
my_list[3]
my_list[5]
my_list[c(3,5)]                               #extract two items from a list at the same time, use concatenate within the square brackets to list the indices to be pulled

#reading in files and creating factors etc
bed_file <- read.table("/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", header=F, sep = '\t') #read in bed file with no header
dim(bed_file) #dimensions of the file read in
class(bed_file)      #class of the file read in - this is a dataframe
nrow(bed_file) #number of rows
ncol(bed_file) #numbers of columns
head(bed_file) #look at top bit of the file

#Add column names. The columns are: "chr", "start", "stop", "name", "score", "strand"
colnames(bed_file) <- c("chr", "start", "stop", "name", "score", "strand")
#display colnames
colnames(bed_file)
names(bed_file)

#extract element at row 30 column 3 of bed_file
bed_file[30,3]

#Extract the second column by index and by name (using both [ ] and $ ), assign these to new variables
second_col <- bed_file[,2]; second_col
second_col <- bed_file$start; second_col

#Calculate the intervals (start-stop) and add them as a new column called int_length.What is a quick way to check you have added this column?
bed_file$int_length <- bed_file$stop - bed_file$start 
colnames(bed_file)
head(bed_file)

#Subset the data frame to contain only regions with a length from 100,001-200,000 bp- assign to a new variable.
subset <- bed_file[bed_file$int_length >= 100001 & bed_file$int_length <= 200000,]
head(subset)
pw
#Write your subsetdata frame to a tab separated file ie (include column names but not rownames
write.table(subset, "intervals_between_100000and20000", sep = "\t", quote = FALSE, row.names = FALSE)
