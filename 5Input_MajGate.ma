[Top]
components : 5InMG

in : in1 in2 in3 in4 in5     
out : out 
Link : in1 in1@5InMG 
Link : in2 in2@5InMG 
Link : in3 in3@5InMG %The design is a five input majority gate
Link : in4 in4@5InMG 
Link : in5 in5@5InMG 
Link : out@5InMG out 

[5InMG] 
type : cell 
width : 6	%Size of matrix based on the design requirement
height : 7
delay : transport
defaultDelayTime : 0
border : nowrapped 
neighbors :              5InMG(-1,0) 	%Defining neighbours here
neighbors : 5InMG(0,-1) 5InMG(0,0) 5InMG(0,1) 
neighbors :              5InMG(1,0) 
in : in1 in2 in3 in4 in5
out : out
Link : in1  in@5InMG(3,0) % 5 Inpts are provided at the given cell locations
Link : in2  in@5InMG(1,1) 
Link : in3  in@5InMG(5,1) 
Link : in4  in@5InMG(0,3)
Link : in5  in@5InMG(6,3)
Link : out@5InMG(3,5) out % Output is provided at cell (3,5)
initialvalue : 0
localtransition : calculus-rule31 { (3,1) } 
zone : calculate-rule33 { (3,3) }
zone : neutral-rule { (0,0) (0,1) (0,2) (1,0) (2,0) (1,2) (2,2) (4,0) (5,0) (6,0) (6,1) (4,2) (5,2) (6,2) (0,4) (1,4) (2,4) (0,5) (1,5) (2,5) (4,4) (5,4) (6,4) (4,5) (5,5) (6,5) }
zone : input-rule { (3,0) (1,1) (5,1) (0,3) (6,3) }
zone : output-rule { (3,5) }
zone : transportSouth-rule { (2,1) (1,3) (2,3) }
zone : transportNorth-rule { (4,1) (5,3) (4,3) }
zone : transportEast-rule_1 { (3,2) } 
zone : transportEast-rule_2 { (3,4) } 

[calculus-rule31] %If all thre inputs 1,2 and 3 are 1, gives 111, if two are 1 gives 11, if one is 1 gives 1 and gives -1 othewise
rule : 111 10 { (-1,0)=1 and (0,-1)=1 and (1,0)=1 } 
rule : 11 10 { (-1,0)=1 and (0,-1)=1 and (1,0)=-1 } 
rule : 11 10 { (-1,0)=1 and (0,-1)=-1 and (1,0)=1 } 
rule : 11 10 { (-1,0)=-1 and (0,-1)=1 and (1,0)=1 } 
rule : 1 10 { (-1,0)=1 and (0,-1)=-1 and (1,0)=-1 } 
rule : 1 10 { (-1,0)=-1 and (0,-1)=1 and (1,0)=-1 } 
rule : 1 10 { (-1,0)=-1 and (0,-1)=-1 and (1,0)=1 } 
rule : -1 10 { (-1,0)=-1 and (0,-1)=-1 and (1,0)=-1 } 
rule : 0 10 { t }

[calculate-rule33] % Output as per the inputs 4,5 and outpu of cell (3,1)
rule : 1 10 { (-1,0)=1 and (0,-1)=111 and (1,0)=1 } 
rule : 1 10 { (-1,0)=1 and (0,-1)=111 and (1,0)=-1 } 
rule : 1 10 { (-1,0)=-1 and (0,-1)=111 and (1,0)=1 } 
rule : 1 10 { (-1,0)=-1 and (0,-1)=111 and (1,0)=-1 } 
rule : 1 10 { (-1,0)=1 and (0,-1)=11 and (1,0)=1 } 
rule : 1 10 { (-1,0)=1 and (0,-1)=11 and (1,0)=-1 } 
rule : 1 10 { (-1,0)=-1 and (0,-1)=11 and (1,0)=1 }
rule : -1 10 { (-1,0)=-1 and (0,-1)=11 and (1,0)=-1 }  
rule : 1 10 { (-1,0)=1 and (0,-1)=1 and (1,0)=1 } 
rule : -1 10 { (-1,0)=1 and (0,-1)=1 and (1,0)=-1 }  
rule : -1 10 { (-1,0)=-1 and (0,-1)=1 and (1,0)=1 } 
rule : -1 10 { (-1,0)=-1 and (0,-1)=1 and (1,0)=-1 } 
rule : -1 10 { (0,-1)=-1 } 
rule : 0 10 { t }

[neutral-rule]
rule : { (0,0) } 5 { t } 

[input-rule]
rule : 0 10 { t } 

[output-rule]
rule : 1 10 { (0,-1)=1 } 
rule : -1 10 { (0,-1)=-1 } 
rule : 0 1 { t } 

[transportSouth-rule]
rule : 1 10 { (-1,0)=1 } 
rule : -1 10 { (-1,0)=-1 } 
rule : 0 5 { t } 

[transportNorth-rule]
rule : 1 10 { (1,0)=1 } 
rule : -1 10 { (1,0)=-1 } 
rule : 0 5 { t } 

[transportEast-rule_1] %Transport East rule for cell (3,2)
rule : 111 10 { (0,-1)=111 } 
rule : 11 10 { (0,-1)=11 } 
rule : 1 10 { (0,-1)=1 } 
rule : -1 10 { (0,-1)=-1 } 
rule : 0 5 { t } 

[transportEast-rule_2] %Transport East rule for cell (3,4)
rule : 1 10 { (0,-1)=1 } 
rule : -1 10 { (0,-1)=-1 } 
rule : 0 5 { t } 