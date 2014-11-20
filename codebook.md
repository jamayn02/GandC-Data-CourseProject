Codebook for Tidy Data Set
==========================


## Raw Data Source

Data was obtained from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)


## Tidy Data Set Variable Nomenclature

Subject: Subject ID numbered from 1-30

Activity: 
  
	1. WALKING
  	2. WALKING_UPSTAIRS
  	3. WALKING_DOWNSTAIRS
  	4. SITTING
  	5. STANDING
  	6. LAYING
  
The 48 other feature variables are named according to the nomenclature below:


                      SAMPLE:                 tBodyAcc.mean...X

  
	* The beginning of each variable will be a `t` or `f`, representing the time or frequency domain, respectively.
	* The next will be `body` or `gravity`, indicating a body or gravitational motion component.
	* Next will be `Acc` or 'Gyr', representing accelerometer or gyroscope signal data.
	* Furthermore, feature variable will have `mean` or `std` indicating the mean or standard deviation.
	* Lastly, the feature variable will have an `X`,`Y`, or `Z` illustrating the direction.
