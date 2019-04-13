
setwd("C:/Users/Moises/Desktop/Rafael/Universidad/coursera/Espcializacion_ds_JH/03_cleaning/proyecto/UCI HAR Dataset")
setwd("C:/Users/rafzambrano/Desktop/coursera/R_J.H/03_limpieza_datos/proyecto/UCI HAR Dataset")


# librarys ----------------------------------------------------------------
library(magrittr)
library(tidyverse)

# 1 Merges the training and the test sets to create one data set -----------------------------------------------------------------------

#Data train
train_dat <- read.table("train/X_train.txt")
train_act <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")

test_dat <- read.table("test/X_test.txt")
test_act <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")

# Consolidacion de datos en un conjunto de datos definitivo
data_def <- cbind(rbind(train_sub,test_sub), rbind(train_act,test_act),
                  rbind(train_dat,test_dat))


# 2 Extracts only the measurements on the mean and standard deviation for each measurement-----------------------------------------------------------------------

variables <- read.table("features.txt")
names(data_def) <- c("participante","actividad",as.character(variables[,2]))

data_def_2 <- data_def[,c(1,2,grep("mean\\(\\)|std",names(data_def)))]


# 3 Uses descriptive activity names to name the activities in the data set-----------------------------------------------------------------------

actividad <- read.table("activity_labels.txt")

data_def_3 <- data_def_2 %>%
  left_join(actividad, by = c("actividad" = "V1")) %>%
  mutate(actividad = V2) %>%
  select(-ncol(.))


# 4 Appropriately labels the data set with descriptive variable names-----------------------------------------------------------------------

names(data_def_3) <- str_replace_all(names(data_def_3), 
                c("Acc" = "acceleration", "mean" = "mean_value", "std" = "standard_deviation", 
                  "Mag-" = "_magnitude_", "Gyro" = "gyroscope", "BodyBody" = "Body",
                  "Jerk" = "_Jerk","^t" = "time_","^f" = "frequency_","Body" = "Body_",
                  "Gravity" = "Gravity_","\\(\\)" = ""))


# 5 From the data set in step 4, creates a second, independent tidy data set with the -----------------------------------------------------------------------
# average of each variable for each activity and each subject

data_def_4 <- data_def_3 %>% group_by(participante,actividad) %>% summarise_all(funs(mean))

write.table(data_def_4,"tidy.txt",row.names = F)
