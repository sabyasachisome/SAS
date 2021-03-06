/*Creating Enhanced Reports
using additional statements and options that enhance the reports*/
proc import datafile = "/folders/myfolders/FunRun_data_id_class" 
DBMS = xlsx out = FR0 replace ;
run;

/*Add the SUM statement to compute subtotals and totals for the numeric variables;
Specify formats for variables by adding the FORMAT statement*/ 
proc print data = FR0 noobs;
var name stu_id gender class fund;
sum fund;
format fund dollar5.1;
run;

/*Computing Group Subtotals*/
proc sort data = fr0;
by class;
run;
proc print data = FR0 noobs;
var name stu_id gender class fund;
sum fund;
by class;
run;

/*Labeling Subtotals and the Grand Total
The previous example uses the default labels for the subtotal and the grand total labels. 
The subtotal default label is the BY variable, and the grand total default label is no label. 
You can use the SUMLABEL= option to replace the default subtotal label 
and the GRANDTOTAL_LABEL= option to replace a blank grand total label.*/
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class';
var name stu_id gender class fund;
sum fund;
by class;
run;

/*Identifying Group Subtotals
You can use both the BY and ID statements in the PROC PRINT step to modify the appearance of your report. 
When you specify the same variables in both the BY and ID statements, 
the PRINT procedure uses the ID variable to identify the start of the BY group.*/
proc print data = FR0 noobs sumlabel="Total Fund Raised" grandtotal_label="Grand Total Fund Raised";
title 'Fund Raised by Class with diff appearance';
var name stu_id gender class fund;
sum fund;
by class;
id class;
run;
















