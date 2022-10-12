#Day 3 R course
#1. Open a new Rstudio script and create 3 new objects
object1 <- (1:5)
object2 <- (5:10)
object3 <- (3:16)
object1

#2. Save your code as .R file and then save the workspace to a .Rdata file.
save.image(file = 'day3_practice_workspace.Rdata')

# 3. Save one object using saveRDS()
saveRDS(object1, file = 'object1.rds')

#4. Remove one of the objects – how can you check it is gone?
rm(object2)
ls()

#5. Clear your workspace completely (remove all objects)
rm(list = ls())
ls()

#6. Display your current working directory.
getwd()

#7. Make a new directory in your linux terminal and then set the R working directory to be that new directory.
#Best to put in full path for this so it works whenever you open teh script from whichever directory you're in
setwd('/project/obds/aejaz/2_baseR/projects/week2_day2/day3_baseR')
getwd()
ls()

#8. Load the objects you saved in the .Rdata file
# need to assign a name to the object to read it into the environment. Can keep the same name or change name to something similar.
#if load function is used then the filename is kept for the object
object1_1 <- readRDS("/project/obds/aejaz/2_baseR/projects/week2_day2/object1.rds")
