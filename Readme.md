# AARFailsafeDesign
This is the supporting materials for the journal paper *Failsafe Mechanism Design for Autonomous Aerial Refueling using State Tree Structure*. Autonomous Aerial Refueling (AAR) is vulnerable to various failures and involves co-operation among autonomous receivers, tankers and remote pilots. Dangerous flight maneuvers may be executed when unexpected failures or command conflicts happen. To solve this problem, a failsafe mechanism based on State Tree Structure (STS) is proposed. The failsafe mechanism is a control logic that guides what subsequent actions the autonomous receiver should take, by observing real-time information of internal low-level subsystems such as guidance and drogue&probe and external instructions from tankers and pilots. 

The *supremicafiles* directory contains the auxiliary Supremica files, which helps the design of STS (Since there is no GUI in STSLib). The detailed information of Supremica can be found at [Supremica](https://supremica.org/ "visit their website").

The *SRC* directory contains tools which help the user compute the supervisor from the supremica output xml files. Meanwhile, the user can directly compute the supervisor according to the guidance of STSLib. (The STSLib can be found in ./SRC/supremica2sts/STS_20140801)

The *Supplement* directory contains pictures and papers supplementary to the journal paper. In detail, it contains all the STS design photos and the comprehensive safety issues.

