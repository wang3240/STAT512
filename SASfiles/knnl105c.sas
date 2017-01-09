*NKNW100c.sas;
options nocenter;
data outlier100; 
   do x=1 to 100 by 5; 
      y=30+50*x+200*normal(0);
      output;
   end;
   x=100; y=30+50*100 -10000;
   d='out'; output;
proc reg data=outlier100;
   model y=x;
   where d ne 'out';
run;
proc reg data=outlier100;
   model y=x;
   output out=a2 r=resid;
run;
symbol1 v=circle i=rl;
proc gplot data=a2;
   plot y*x;
proc gplot data=a2;
   plot resid*x/ vref=0;
run;