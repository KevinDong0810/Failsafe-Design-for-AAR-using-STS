#Xml2STS
This directory contains the auxiliary MATLAB functions which can help the user assemble the input file of STSLib, say Root.sts, manually from the Supremica output files. Or the user can directly build Root.sts according to the STSLib rule.

#Procedure
Firstly, the user should output every automaton in Supremica in the form of **xml**, and collect them in the *xml2stsinput* directory. Then, prepare the cells called inputfilelist and outputfilelist, which contains the input xml file name and desired output file name. An example can be seen in "Xml2stsInput.mat". Finally, run the "main.m".

#Assemble the Root.sts
Owing to the hierarchy characteristic of STS, the user has to assemble different automata of Supremica according to the state tree. Pay special attention to those virtual states including "Joining", "Refueling" and "Reforming" and "Standby_RTL_EL". These states do not exist in the STS and are used for the convenience of Supremica. Transitions directed to them should be redirected to the correct simple states.

#Calculate the supervisor
The user is encouraged to name their STS input file after "Root.sts"  and put it in the "./STS_20140801/AAR". Then run the "XPSTS.exe". First reset the user directory and then run the "STS Procedures".  Preferred name for PLANT, SPEC and Supervisor is ROOT, SPEC and SUPER. The XPSTS.exe will calculate the supervisor in approximate 10 seconds, but generating the graph of whole control function is time-consuming. So the user can just turn "XPSTS.exe" off.

#Result
example:
SUPER_1cn: the controlled behavior of event 1
SUPER_1cn_enall: event 1 is enabled at all the states
SUPER_1cn_disall: event 1 is disabled at all the states
SUPER_CB: controlled behavior of the plant. If SUPER_CB is empty, it represents: the controlled behavior is "false", i.e., no controlable event is enabled. All the controlable events are disabled. 

When "XXX_cn_disall" or empty "XXX_CB" appears, in most cases the STS input is wrong and should be carefully checked.
