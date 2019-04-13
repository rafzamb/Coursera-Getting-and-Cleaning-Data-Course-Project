# Code book del Proyecto Final del curso de Coursera *Getting and Cleaning Data*

Al descargar los datos para desarrollar el proyecto (mediante el siguiente link:[Descarga de Datos](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)) nos encontraremos con los siguientes archivos:

- Las carpetas `test` y `train` donde se encuentran los archivos `X_test.txt`, `y_test.txt`, `subject_test.txt` y `X_train.txt`, `y_train.txt`, `subject_train.txt`. Los archivos `X` contienen las variables numéricas sobre las cuales se cuales se calcularan los promedios finales, por su parte los denominados con `y` representan las actividades realizadas numeradas del 1 al 6, finalmente los archivos con el prefijo `subject` identifican a los individuos.
- El archivo `activity_labels.txt` contiene los nombres de las actividades.
- `features.txt` contiene los verdaderos nombres de las variables numéricas.
- El archivo `features_info.txt` contiene una descripción bastante específica referente al conjunto de variables numéricas.


Las asignaciones pautadas para este proyecto desarrolladas en el script `analysis.R` son las siguientes:

- 1) Fusionar los datos de `test` y `train` para formar una data única.
- 2) Extraer solo las mediciones de la media y la desviación estándar para cada medición.
- 3) Utilizar los nombres de las actividades descriptivas para nombrar las actividades en el conjunto de datos.
- 4) Etiquetar adecuadamente el conjunto de datos con nombres de variables descriptivas.
- 5) A partir del conjunto de datos en el paso 4, crear un segundo conjunto de datos ordenado independiente con el promedio de cada variable para cada actividad y cada individuo.

Únicamente se necesita del paquete `tidyverse` para ejecutar de manera satisfactoria el script. A continuación se presentan la manera en la que el script `analysis.R` resuelve y cumple con las asignaciones pautadas:

- 1) Mediante el comando `read.table` se cargan todos los archivos de las carpetas train y test, luego se combinan las datas `X`, `y` y `subject` en tres datas consolidadas mediante el comando `rbind` para luego fusionar estas tres datas en una data final consolidad mediante  el comando `cbind`.
- 2) Una vez cargado el archivo `features.txt` se busca mediante el comando `grep` seleccionar únicamente las variables que contengan las palabras mean() y std.
- 3) Mediante la `funcion left_join` se asocian los verdaderos valores de las actividades, cambiando los números del 1 al 6 por los nombres de las actividades.
- 4) Para que los nombres de las variables tengan un sentido más descriptivo e interpretativo, se buscan las abreviaciones que contienen los nombres de las columnas a los que se hacen referencia en el archivo `features_info.txt` y se establecen los patrones y sus respectivos remplazos mediante la funcion `str_replace_all`.
- 5) Para calcular los promedios únicos para todas las variables categóricas por actividad e individuo, se hace uso de la función `gruop_by` para agrupar por actividad e individuo y a través de la función `summarise_all` se calcula el promedio para el resto de las variables, todo esto mediante los operadores `%>%` del paquete `tidyverse`.

Finalmente se obtiene el archivo `tidy.txt` que consta de 180 observaciones y 68 columnas.
