# R Exercises and assignment 

# packages i load every time; uses "pacman"
pacman::p_load(pacman,dplyr, GGally, ggplot2, ggthemes,ggvis, httr, lubridate, 
               plotly, rio, rmarkdown, shiny, stringr, tidyr)

# Installs pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")


#vector created with different variable names sex, stage, treatment and myc
# <- operator and assigned them to the values 
# c- concatenate or combine the values in the bracket

(sex <- c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F"))
(stage <- c("I", "II", "II", "I", "II", "II", "I", "II", "II", "I", "II", "II"))
(treatment <- c("A", "A", "A", "A", "B", "B", "B", "B", "P", "P", "P", "P"))
(myc <- c(2343, 457, 4593, 9035, 3450, 3524, 958, 1053, 8674, 3424, 463, 5105))


# meta is the variable name 
# cbind is the column bind to combine all the columns together
# as.data.frame makes a data frame with the variables and data types define above
# () before then meta and after the function execute , store and return out 

(meta <- as.data.frame(cbind(sex, stage, treatment, myc)))

# row.names<- returns a data frame with the row names changed.
# paste() concatenate the sample 1:12 and assign it to all the rows
# sep"" a character string to separate the terms

row.names(meta) <- paste("sample", 1:12, sep="")
# rownames(meta) <- c("sample1", "sample2", "sample3", "sample4", "sample5", "sample6", "sample7", "sample8", "sample9", "sample10", "sample11", "sample12")
meta

# return only the treatment and sex columns using []
# empty , will return all the rows of both the sex and the treatment 
meta[, c(1,3)]

# return the treatment values for samples 5, 7, 9, and 10 using []
# this command look into treatment columns and pull the correspondent sample in 5,7,9 and 10
meta[c(5,7,9,10), "treatment"]

# use filter() to return all data for those samples receiving treatment P:
# return all the sample that has treatment "P"
# Use filter() find rows/cases where conditions are true.

filter(meta, treatment == "P") 

# use filter()/select()to return only the stage and treatment columns for those samples with myc > 5000:
# this filter return only the stage and treatment with data of myc greater than 5000
# pipes from dplyr.
# %>% this takes the result of one step and feed it directly into the in next step of dataset

filter(meta, myc > 5000) %>% select(stage, treatment)

# remove the treatment column from the dataset using []
#  , will keep all the rows and - indicate remove or delete the 3 column 

meta[, -3]

# remove samples 7, 8 and 9 from the dataset using []
# - sign mean remove which remove the dataset from 7 to 9 from meta 
# , space mean read all columns 
meta[-7:-9, ]

# keep only samples 1-6 using 
# the : means "to" from 1 to 6 should be kept

meta[1:6, ]


# add a column called pre_treatment to the beginning of the dataframe with the values T, F, F, F, T, T, F, T, F, F, T, T (Hint: use cbind()
# define a variable called pre_treatment
#cbind is the combine variables together 

pre_treatment <- c(T, F,F,F,T,T,F,T,F,F,T,T)
meta <- cbind.data.frame(pre_treatment, meta)
meta

#change the names of the columns to: “A”, “B”, “C”, “D”:
#colnames(meta) <- c("A", "B", "C", "D")
#meta

#meta$A <- NULL
#meta$B <- NULL
#meta$C <- NULL
#meta$D <- NULL

#meta

#change the names of the columns to: “A”, “B”, “C”, “D”:
#colnames(meta) <- c("A", "B", "C", "D")
#meta

#meta$A <- NULL

#change the names of the columns to: “A”, “B”, “C”, “D”:
# colnames[] will automatically renamed and change all the old colukn names with the new on 
colnames(meta) <- c("A", "B", "C", "D")
meta
