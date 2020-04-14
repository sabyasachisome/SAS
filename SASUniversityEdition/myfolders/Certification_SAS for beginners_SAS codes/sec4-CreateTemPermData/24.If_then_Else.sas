/* using If Then Else statements*/

proc import datafile = "/folders/myfolders/score_data_miss" 
DBMS = xlsx out = scoredata0 replace ;
run;

data scoredata1;
   set scoredata0; 
   /*using SAS functions*/
    TotalScore = sum (score1, score2, score3);
	AverageScore = mean (score1, score2, score3);
run;

DATA scoredata_IfThenElse;
set scoredata1;
	/*using If...Then...Else statements*/
		/*gender_num*/
	If gender = 'm' then gender_num = 1;
	else if gender = 'f' then gender_num = 0;
	else gender_num = . ;
	
	/*take*/
	IF score1 NE . AND score2 NE .  AND score3 NE .  THEN take = 'complete';
	else take = 'incomplete';
	
	/*grade & pass*/
	IF AverageScore >= 90 THEN DO;
       grade = 'A'; 
	   pass = 'pass';
    end;
    Else If averageScore >= 80 then do;
       grade = 'B';
       pass = 'pass';
	END;  
	Else If averageScore >= 70 then do;
       grade = 'C';	
       pass = 'pass';
	END;  
	Else If averageScore >= 60 then do;
       grade = 'D';
       pass = 'pass';
	END;  
	Else If 0 =< averageScore < 60 then do;
       grade = 'F';
       pass = 'fail';
	END; 
	else do;
	grade = ' ';
       pass = ' ';
	END; 
	   
run;    

proc print DATA= scoredata_ifthenelse; 
run;  

------------------------------------------------
/*
practise
*/

libname sec4 '/folders/myfolders/libraries/sec4';

proc import datafile='/folders/myfolders/Data_201902/score_data_miss'
dbms = xlsx out= sec4.score_data_miss_if_then_else0 replace;
run;

data sec4.score_data_miss_if_then_else1;
set sec4.score_data_miss_if_then_else0;
if gender= 'm' then gender_num=1;
else if gender='f' then gender_num=0;
else gender_num= .;
run;