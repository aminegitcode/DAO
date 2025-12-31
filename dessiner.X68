*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------


BOUCLE_DESSIN:
    MOVE.W #8,D1   ; largeur du crayon en pixels
    JSR WIDTH_PEN

DESSIN_BOUCLE:
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    

     ; afficher l'outil actuel
    MOVE.W #$0B1E,D1
    JSR POS_CURS

    MOVE.B OUTIL_ACTUEL,D5
    CMP.B #0,D5
    BEQ afficher_crayon
    CMP.B #1,D5
    BEQ afficher_gomme
    CMP.B #2,D5
    BEQ afficher_forme
    CMP.B #3,D5
    BEQ afficher_remplissage
    BRA SUITE_OUTIL

afficher_crayon:
    MOVE.L #CRAYON1,A0
    JSR AFFCHAINE
    BRA SUITE_OUTIL

afficher_gomme:
    MOVE.L #GOMME1,A0
    JSR AFFCHAINE
    BRA SUITE_OUTIL

afficher_forme:
    MOVE.L #FORME,A0
    JSR AFFCHAINE
    BRA SUITE_OUTIL

afficher_remplissage:
    MOVE.L #REMPLISSAGE1,A0
    JSR AFFCHAINE

SUITE_OUTIL:
 
    ; afficher la couleur actuel
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_FILL_COLOR
    MOVE.W #295,D1
    MOVE.W #450,D2
    MOVE.W #310,D3
    MOVE.W #465,D4
    JSR DRAW_FILL_RECT

  
    ; lire souris
    MOVE.L #0,D1
    JSR GET_MOUSE 

    ; vérifier clic gauche
    MOVE.B D0,D4
    ANDI.B #1,D4
    BEQ DESSIN_BOUCLE         

    ; récuperer X,Y
    
    MOVE.L D1,D2          ; copier D1 dans D2
    MOVE.W D2,D3          ;  recuperer X et le stcoker dans D3
    MOVE.L #16,D7   ; mettre 16 dans D7
    LSR.L D7,D2    ; décaler D2 de 16 bits à droite

    AND.L #$FFFF,D2       ; appliquer un masquage pour D2
    MOVE.W D2,D2 

    ; vérifier zone de dessin
    CMP.W #45,D2            ; Y min
    BLT CHOISIR_OUTIL
    CMP.W #450,D2            ; Y max
    BGT DESSIN_BOUCLE

    ; choisir outil
    MOVE.B OUTIL_ACTUEL,D5
    CMP.B #0,D5
    BEQ CRAYON
    CMP.B #1,D5
    BEQ GOMME
    CMP.B #3,D5
    BEQ REMPLISSAGE

    BRA DESSIN_BOUCLE

;-------------------------------
CRAYON:
    
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_PEN_COLOR

    MOVE.W D3,D1    ; X
    JSR DRAW_PIX

    BRA DESSIN_BOUCLE

;-------------------------------
GOMME:
    MOVE.L #$00FFFFFF,D1
    JSR SET_PEN_COLOR

    MOVE.W D3,D1    ; X
    JSR DRAW_PIX

    BRA DESSIN_BOUCLE
;-----------------------
REMPLISSAGE:
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_FILL_COLOR

    MOVE.W D3,D1    ; X
    JSR POT_DE_PEINTURE

    BRA DESSIN_BOUCLE



CHOISIR_OUTIL:
    ;verifier si le clique est dans la zonne des couleurs
    CMP.W #83,D3       ; X min
    BLT check_crayon
    CMP.W #155,D3       ; X max
    BGT check_crayon
    CMP.W #9,D2        ; Y min
    BLT check_crayon
    CMP.W #36,D2       ; Y max
    BGT check_crayon
    
    ;recuperer la couleur
    MOVE.W D3,D1       ; mettre X dans D1
    JSR GET_PIX_COLOR
    MOVE.L D0,COULEUR_ACTUEL 
    BRA FIN_CHOIX_OUTIL
check_crayon:
    ;crayon
    CMP.W #5,D3          ; X min
    BLT check_gomme
    CMP.W #75,D3         ; X max
    BGT check_gomme
    CMP.W #5,D2          ; Y min
    BLT check_gomme
    CMP.W #40,D2         ; Y max
    BGT check_gomme
    MOVE.B #0,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL

check_gomme:
    ; gomme
    CMP.W #163,D3        ; X min
    BLT check_remplissage
    CMP.W #230,D3        ; X max
    BGT check_remplissage
    CMP.W #5,D2          ; Y min
    BLT check_remplissage
    CMP.W #40,D2         ; Y max
    BGT check_remplissage
    MOVE.B #1,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL

check_remplissage:
    ; remplissage
    CMP.W #235,D3        ; X min
    BLT check_formes
    CMP.W #335,D3        ; X max
    BGT check_formes
    CMP.W #5,D2          ; Y min
    BLT check_formes
    CMP.W #40,D2         ; Y max
    BGT check_formes
    MOVE.B #3,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL

check_formes:
    ; formes
    CMP.W #340,D3        ; X min
    BLT FIN_CHOIX_OUTIL
    CMP.W #440,D3        ; X max
    BGT FIN_CHOIX_OUTIL
    CMP.W #5,D2          ; Y min
    BLT FIN_CHOIX_OUTIL
    CMP.W #40,D2         ; Y max
    BGT FIN_CHOIX_OUTIL
    MOVE.B #2,OUTIL_ACTUEL


FIN_CHOIX_OUTIL:
    BRA DESSIN_BOUCLE
    
    
    
    
    
    
OUTIL_ACTUEL:   DC.B 0           ; 0=crayon, 1=gomme, 2=formes, 3=remplissage
COULEUR_ACTUEL: DC.L $F00AD025

CRAYON1:        DC.B 'CRAYON     ',0
GOMME1:         DC.B 'GOMME      ',0
FORME:        DC.B 'FORMES       ',0
REMPLISSAGE1:   DC.B 'REMPLISSAGE',0

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
