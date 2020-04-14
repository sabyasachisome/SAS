/* Convert Data */

/*create data scoredata0*/
proc import datafile = "/folders/myfolders/convert data" 
DBMS = xlsx out = scoredata0 replace ;
run;

/*Character-to-Numeric Conversion*/
data scoredata1;
set scoredata0;
score_ac = raw_score * 1; /*auto*/
score_num = input (raw_score, 7.); /*input*/
run;

/*Numeric-to-Character Conversion*/
data scoredata2;
set scoredata0;
gender_ac = gender||'/'||gender_code; /*auto*/
gender_char = put (gender_code, 8.); /*put*/
run;

-------------------------------------------

libname sec6 "/folders/myfolders/libraries/sec6";
proc import datafile="/folders/myfolders/Data_201902/Convert Data.xlsx"
dbms= xlsx out= sec6.Convert_Data0 replace;
run;

data sec6.Convert_Data1;
set sec6.Convert_Data0;
score_ac=raw_Score*1;
score_num= input(raw_Score, 7.);

gender_code_char= put(gender_code, 8.);
run;


proc print data=sec6.Convert_Data1;
run;

