This repository contains all google colab notebooks used in my thesis. 
They are ordered into files based on the subtitles in the materials and method section of the thesis. 
The Data Acquisition file contains the code used to clip the individual plants out of the orthomosaic with manual controls of the location for each clipping.
The Data Exploration file details the code for each step in the data exploration section.
The Data Preprocessing file includes the codes used to create the stratified train-test sets, based on the threshold classes (Keep and Discard). It also includes a file to
redistribute the threshold classed of the train set into the breeder's classes, because for the classification models it was thought to be more useful to work with these classes
to create the stratified train-validation splits. 
The Random Forest file contains the three RF models: threshold, classification and regression.
The CNN file comprises of the three CNN models. 
