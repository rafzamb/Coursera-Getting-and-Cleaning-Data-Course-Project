# librarys ----------------------------------------------------------------
library(tidyverse)

# 1 Merges the training and the test sets to create one data set -----------------------------------------------------------------------

#Data train
train_dat <- read.table("train/X_train.txt")
train_act <- read.table("train/y_train.txt")
train_sub <- read.table("train/subject_train.txt")

#Data test
test_dat <- read.table("test/X_test.txt")
test_act <- read.table("test/y_test.txt")
test_sub <- read.table("test/subject_test.txt")

# Consolidacion de datos en un conjunto de datos definitivo
data_def <- cbind(rbind(train_sub,test_sub), rbind(train_act,test_act),
                  rbind(train_dat,test_dat))


# 2 Extracts only the measurements on the mean and standard deviation for each measurement-----------------------------------------------------------------------
variables <- read.table("features.txt")

#Se establece el encabezado del data frame data_def
names(data_def) <- c("participante","actividad",as.character(variables[,2]))

#Se obtienen los patrones para exraer unicamente las variables que contengan media() y std
data_def_2 <- data_def[,c(1,2,grep("mean\\(\\)|std",names(data_def)))]


# 3 Uses descriptive activity names to name the activities in the data set-----------------------------------------------------------------------
actividad <- read.table("activity_labels.txt")

#Se realiza una union para tomar los nombres de las actividades
data_def_3 <- data_def_2 %>%
  left_join(actividad, by = c("actividad" = "V1")) %>%
  mutate(actividad = V2) %>%
  select(-ncol(.))


# 4 Appropriately labels the data set with descriptive variable names-----------------------------------------------------------------------

#Se establecen los patrones y valores a sustituir para darle un mayor sentido descriptivo a las variables,
#en la medida de lo posible se trata de separar las palabras a través del simbolo "_".
names(data_def_3) <- str_replace_all(names(data_def_3), 
                c("Acc" = "acceleration", "mean" = "mean_value", "std" = "standard_deviation", 
                  "Mag-" = "_magnitude_", "Gyro" = "gyroscope", "BodyBody" = "Body",
                  "Jerk" = "_Jerk","^t" = "time_","^f" = "frequency_","Body" = "Body_",
                  "Gravity" = "Gravity_","\\(\\)" = ""))


# 5 From the data set in step 4, creates a second, independent tidy data set with the -----------------------------------------------------------------------
# average of each variable for each activity and each subject

#Finalmente se agrupan las variables "participante" y "actividad" para luego calcular los promedios al resto
#de las variables.
data_def_4 <- data_def_3 %>% group_by(participante,actividad) %>% summarise_all(funs(mean))

write.table(data_def_4,"tidy.txt",row.names = F)
