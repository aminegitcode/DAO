*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
   AFFCAR:
        MOVE #6,D0
        TRAP #15
        RTS
   
   
   SAISCAR:
        MOVE #5,D0
        TRAP #15
        RTS
        
   FINPRG:
        MOVE #9,D0
        TRAP #15 
        
   AFFCHAINE:
        MOVE.B (A0),D1
        JSR AFFCAR
        ADD.L #1,A0
        CMP.B #0,D1
        BNE AFFCHAINE 
        RTS
        
   SAISCHAINE:
         JSR SAISCAR 
         CMP.B #13,D1
         BEQ FIN1
         MOVE.B D1,(A0)
         ADD.L #1,A0
         BRA SAISCHAINE
    FIN1:
         MOVE.B #0,(A0)
         RTS
    
    POS_CURS:
        MOVE #11,D0
        TRAP #15
        RTS
    GET_AFFCAR:
        MOVE #22,D0
        TRAP #15
        RTS



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
