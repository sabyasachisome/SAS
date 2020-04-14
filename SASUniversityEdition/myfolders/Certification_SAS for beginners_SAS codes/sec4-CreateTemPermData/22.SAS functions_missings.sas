/* SAS functions missings  */

proc import datafile = "/folders/myfolders/score_data" 
DBMS = xlsx out = scoredata0 replace ;
run;

DATA scoredata2;
   set scoredata0; 
                                  
   TotalScore = score1 + score2 + score3; /*missing values*/
   AverageScore = TotalScore/3;  /*missing values*/    
   
/*use SAS functions to use only non-missing values for the computation */    
	TotalScore_func = sum (score1, score2, score3);
	AverageScore_func = mean (score1, score2, score3);
	
	Gender_func = UPCASE(gender);                              
	
RUN;

PROC PRINT DATA = scoredata2;
RUN;

------------------------------------------------
/*
practise
*/

libname sec4 '/folders/myfolders/libraries/sec4/';

proc import datafile='/folders/myfolders/Data_201902/score_data.xlsx'
dbms= xlsx out= sec4.scoredata0 replace;
run;

data sec4.scoredata1;
set sec4.scoredata0;
Grade= 7;
TotalScore= score1+score2+score3;
AvgScore= TotalScore/3;
run;

proc import datafile='/folders/myfolders/Data_201902/score_data.xlsx'
dbms = xlsx out= sec4.scoredata2 replace;
run;

data sec4.scoredata3;
set sec4.scoredata2;
total_new= sum(score1,score2,score3);
run;

proc print data= sec4.scoredata3;
run;