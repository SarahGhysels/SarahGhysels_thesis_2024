This repository contains all google colab notebooks used in my thesis. 
They are ordered into folders based on the subtitles in the materials and method section of the thesis. 
The Data Acquisition folder contains the code used to clip the individual plants out of the orthomosaic automatically (R file) and with manual controls of the location for each clipping (python file).
The Data Exploration folder details the code for each step in the data exploration section.
The Data Preprocessing folder includes the codes used to create the stratified train-test sets, based on the threshold classes (Keep and Discard). It also includes a file to
redistribute the threshold classed of the train set into the breeder's classes, because for the classification models it was thought to be more useful to work with these classes
to create the stratified train-validation splits. 
The Random Forest folder contains the three RF models: threshold, classification and regression.
The CNN folder comprises of the three CNN models. 
