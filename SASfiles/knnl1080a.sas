*KNNL1080a, Pr. 24.16;
data service;
	infile 'h:\stat512\datasets\ch19pr16.dat';
	input time tech make k;
	mt = make*10+tech;
proc print data=service;
run;
title1 'Proc mixed';
proc mixed data=service;
	class make tech;
	model time = make / chisq ;
	random tech make*tech;
run;
title1 'Proc glm with tech, make*tech random';
proc glm data=service;
	class make tech;
	model time = make tech make*tech;
	random tech make*tech/test;
run;
title1 'Proc glm with tech random';
proc glm data=service;
	class make tech;
	model time = make tech make*tech;
	random tech /test;
run;title1 'Proc glm with tech fixed';
proc glm data=service;
	class make tech;
	model time = make tech make*tech;
	means make tech / tukey;
proc glm data=service;
	class mt;
	model time = mt;
	means mt/t;
run;
proc gplot data=service;
	plot time*mt;
	plot time*make=tech;
	plot time*tech=make;
	run;
quit;