# Coursera-Getting-and-Cleaning-Data-Course-Project

El "Getting-and-Cleaning-Data-Course-Project" es el proyecto final del curso de Coursera: Obtención y limpieza de datos. En este repositorio se presentan las asignaciones pautadas en este proyecto, se incluyen los siguientes archivos:

- `run_analysis.R`: Este es el scipt de R en el cual se desarrolla el proyecto, solo se necesita descargar los datos y alojarlos en su directorio para que se ejecute de manera correcta el código.
- `CodeBook.md`: Este archivo describe las variables de las datas a utilizar, además de presentar de manera general los procedimientos plasmados en el proyecto.
- `tidy_data.txt`: Esta es la salida final del proyecto.
- `README.md`: Archivo que presenta una visión general del repositorio.

Los datos sobre los cuales se fundamenta el proyecto pueden descargarse desde el siguiente link [Descarga de archivos](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) y para ver el sitio web de donde se obtuvo la data que además tiene una descripción detallada de los datos se puede seguir este link [Web Oficial](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)


### Descripción General
Para tener una idea general del estudio se puede revisar el archivo `Readme.txt` que se encuentra en el mismo archivo [Zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) donde se descargan los datos, a continuación se muestra un extracto de dicho archivo para entender un poco el contexto bajo l cual se desarrolla el estudio:


>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

