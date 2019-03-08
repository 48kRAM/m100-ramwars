1 REM R=ram labels, C=cash, D=debt, U=holding qty, B=base $, P=pricing, F=cur location,T=day
9 REM Initialize game state and vars
10 POKE-902,PEEK(-1745):DEFINT X-Z:D=1000:C=1000:DIMU(4):F=5:DATA 2102,11,4116,30,8464,80,41256,112:FOR X= 1TO4:READ A(X):READ B(X):NEXT
15 DATA "Armonk","Dallas","Milpitas","Norristown","Sunnyvale":FORX=1TO5:READ L$(X):NEXT
29 REM Generate pricing, Print RAM stock
30 CLS:T=T+1:PRINT@0,"Day ";T;L$(F);"  You owe:";D:PRINT@40,"Holding"::PRINT@60,"For Sale":FORX=1TO4:P(X)=RND(1)*B(X):PRINT USING "#####";A(X);:PRINT U(X):PRINT@(40*(X+1))+20,"";:PRINT USING"#####";A(X);:PRINT USING"$$####";P(X):NEXT
40 PRINT@240,"";:INPUT"(B)uy, (S)ell, (M)ove";I$:IF I$="b" THEN INPUT "Type, Qty";T,Q
50 IF I$="m" THEN CLS:FORX=1TO5:PRINTX;"- ";L$(X):NEXT:INPUT"Where to";F:GOTO 30
