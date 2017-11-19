Input files:
	1. The input files are stored in AAR fileholder, please set the file path into it.
	2. the plant is ROOT.sts, while the specification is SPEC.sts (this is an empty file)

Output files:
(I name the supervisor after SUPER)
SUPER_1cn: the controlled behavior of event 1
SUPER_1cn_enall: event 1 is enabled at all the states
SUPER_1cn_disall: event 1 is disabled at all the states

SUPER_CB: controlled behavior of the plant.

If SUPER_CB is empty, it represents:
the controlled behavior is "false", i.e., no controlable
   event is enabled. All the controlable events are disabled.

Note that the control function only take fewer than 2 seconds, but drawing the BDD for the whole system may takes more than one hour. So pleaze close the program after acquiring the SUPER_CB file 

Please copy all the SUPER_XXcn files into the PostProcess as the input of MATLAB wrapper functions
