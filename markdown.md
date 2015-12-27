---
title: "Readme/Codebook"
author: "David L. Anderson"
date: "December 27, 2015"
output: html_document
---

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAccXYZ and tGyroXYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkXYZ and timeBodyGyroJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fftBodyAccXYZ, fftBodyAccJerkXYZ, fftBodyGyroXYZ, fftBodyAccJerkMag, fftBodyGyroMag, fftBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'xyz' is used to denote 3-axial signals in the X, Y and Z directions.

================================

The included script combines both the test and training data into one datatable.

After this, the data for mean and standard deviation were subsetted, and the variable names cleaned up.

 "timebodyaccmeanx"           
 "timebodyaccmeany"          
 "timebodyaccmeanz"           
 "timebodyaccstdx"           
 "timebodyaccstdy"            
 "timebodyaccstdz"           
 "timegravityaccmeanx"        
 "timegravityaccmeany"       
 "timegravityaccmeanz"        
 "timegravityaccstdx"        
 "timegravityaccstdy"         
 "timegravityaccstdz"        
 "timebodyaccjerkmeanx"       
 "timebodyaccjerkmeany"      
 "timebodyaccjerkmeanz"       
 "timebodyaccjerkstdx"       
 "timebodyaccjerkstdy"        
 "timebodyaccjerkstdz"       
 "timebodygyromeanx"          
 "timebodygyromeany"         
 "timebodygyromeanz"          
 "timebodygyrostdx"          
 "timebodygyrostdy"           
 "timebodygyrostdz"          
 "timebodygyrojerkmeanx"      
 "timebodygyrojerkmeany"     
 "timebodygyrojerkmeanz"      
 "timebodygyrojerkstdx"      
 "timebodygyrojerkstdy"       
 "timebodygyrojerkstdz"      
 "timebodyaccmagmean"         
 "timebodyaccmagstd"         
 "timegravityaccmagmean"      
 "timegravityaccmagstd"      
 "timebodyaccjerkmagmean"     
 "timebodyaccjerkmagstd"     
 "timebodygyromagmean"        
 "timebodygyromagstd"        
 "timebodygyrojerkmagmean"    
 "timebodygyrojerkmagstd"    
 "fftbodyaccmeanx"            
 "fftbodyaccmeany"           
 "fftbodyaccmeanz"            
 "fftbodyaccstdx"            
 "fftbodyaccstdy"             
 "fftbodyaccstdz"            
 "fftbodyaccjerkmeanx"        
 "fftbodyaccjerkmeany"       
 "fftbodyaccjerkmeanz"        
 "fftbodyaccjerkstdx"        
 "fftbodyaccjerkstdy"         
 "fftbodyaccjerkstdz"        
 "fftbodygyromeanx"           
 "fftbodygyromeany"          
 "fftbodygyromeanz"           
 "fftbodygyrostdx"           
 "fftbodygyrostdy"            
 "fftbodygyrostdz"           
 "fftbodyaccmagmean"          
 "fftbodyaccmagstd"          
 "fftbodybodyaccjerkmagmean"  
 "fftbodybodyaccjerkmagstd"  
 "fftbodybodygyromagmean"     
 "fftbodybodygyromagstd"     
 "fftbodybodygyrojerkmagmean" 
 "fftbodybodygyrojerkmagstd" 
 "activityname"               
 "subjectid"  
 
Finally, it is split into groups by activityname and subjectid, and the final tidy data is written to a text file.

If you want to read in the final tidy data, simply:
    finaltidytable <- read.table("finaltidydata")