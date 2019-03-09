1 REM A=ram labels, C=cash, D=debt, U=holding qty, B=base $, P=pricing, F=cur location,T=day, I=int rate
9 REM Initialize game state and vars
10 POKE-902,PEEK(-1745):DEFINT C-Z:D=1000:C=D:T=1:F=5:DATA 2102,11,4116,30,8464,80,41256,112:FOR X= 1TO4:READ A(X):READ B(X):NEXT
20 FORX=1TO4:P(X)=(RND(1)+.1)*B(X):NEXT:DATA "Armonk","Dallas","Milpitas","Norristown","Sunnyvale":FORX=1TO5:READ L$(X):NEXT
29 REM Print RAM stock & sale price
30 CLS:PRINT@0,"Day";T;L$(F);"  Cash:";C;" Owe:";D:PRINT@40,"Holding"::PRINT@60,"For Sale"
35 FORX=1TO4:PRINTCHR$(96+X);:PRINT USING " #####";A(X);:PRINT U(X):PRINT@(40*(X+1))+20,"";:PRINT USING"#####";A(X);:PRINT USING"$$####";P(X):NEXT
40 PRINT@240,"";:INPUT"(B)uy, (S)ell, (M)ove";I$:IF I$="b" OR I$="s" THEN INPUT"Type, Qty";G$,Q:H=ASC(G$)-96:IF I$="b" THEN 60 ELSE 70
50 IF I$="m" THEN CLS:FORX=1TO5:PRINTX;"- ";L$(X):NEXT:INPUT"Where to";F:T=T+1:D=D*1.06:FORX=1TO4:P(X)=(RND(1)+.1)*B(X):NEXT:GOTO 30
59 REM Buying chips routine
60 X=Q*P(H):IFX>C OR P(H)=0 OR U(H)+Q>100 THEN SOUND11000,30:GOTO 30 ELSE U(H)=U(H)+Q:C=C-(Q*P(H)):GOTO 30
69 REM Selling chips routine
70 IF Q > U(H) THEN SOUND11000,30:GOTO 30 ELSE U(H)=U(H)-Q: C=C+(Q*P(H)):GOTO 30
79 REM Bank routine
