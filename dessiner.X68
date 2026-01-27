*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------



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
    CMP.B #4,D5
    BEQ afficher_forme
    CMP.B #5,D5
    BEQ afficher_forme
    CMP.B #6,D5
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
    CMP.B #2,D5
    BEQ FORMES
    CMP.B #4,D5
    BEQ FORMES
    CMP.B #5,D5
    BEQ FORMES
    CMP.B #6,D5
    BEQ FORMES

    BRA DESSIN_BOUCLE

;-------------------------------dessiner
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
;--------------------------------
FORMES:

    CMP.B #0,FORME_ETAPE
    BNE FORME_deuxieme_clic
    BRA FORME_premier_clic


FORME_premier_clic:
    ANDI.B #1,D0       ; verfier si clic gauche
    BEQ DESSIN_BOUCLE  ;
    
click_en_cours:
    MOVE.L #0,D1
    JSR GET_MOUSE
    ANDI.B #1,D0       ; si clic gauche
    BNE click_en_cours

    
    
    MOVE.W D3,X1     ; X souris
    MOVE.W D2,Y1     ; Y souris
  
    MOVE.B #1,FORME_ETAPE
    BRA DESSIN_BOUCLE



FORME_deuxieme_clic:
    ANDI.B #1,D0       ; D0.B = 1 si clic gauche
    BEQ DESSIN_BOUCLE 
click_en_cours1:
    MOVE.L #0,D1
    JSR GET_MOUSE
    ANDI.B #1,D0       ; si clic gauche
    BNE click_en_cours1
    
    MOVE.W D3,X2
    MOVE.W D2,Y2

    MOVE.B #0,FORME_ETAPE

    ; trouver quelle forme qu'on va dessiner
    CMP.B #2,D5
    BEQ dessiner_rect
    CMP.B #4,D5
    BEQ dessiner_fill_rect
    CMP.B #5,D5
    BEQ dessiner_cercle
    CMP.B #6,D5
    BEQ dessiner_fill_cercle

  

dessiner_rect:
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_PEN_COLOR
    
    MOVE.W X1,D1       ; X départ
    MOVE.W Y1,D2       ; Y départ
    MOVE.W X2,D3       ; X fin
    MOVE.W Y2,D4       ; Y fin
    JSR DRAW_RECT
    BRA DESSIN_BOUCLE

dessiner_fill_rect:
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_PEN_COLOR
    JSR SET_FILL_COLOR
    MOVE.W X1,D1       ; X départ
    MOVE.W Y1,D2       ; Y départ
    MOVE.W X2,D3       ; X fin
    MOVE.W Y2,D4       ; Y fin
    JSR DRAW_FILL_RECT
    BRA DESSIN_BOUCLE

dessiner_cercle:
    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_PEN_COLOR

    MOVE.W X1,D1       ; X départ
    MOVE.W Y1,D2       ; Y départ
    MOVE.W X2,D3       ; X fin
    MOVE.W Y2,D4       ; Y fin
    JSR DRAW_ELLIPSE
    BRA DESSIN_BOUCLE

dessiner_fill_cercle:

    MOVE.L COULEUR_ACTUEL,D1
    JSR SET_PEN_COLOR
    JSR SET_FILL_COLOR

    MOVE.W X1,D1       ; X départ
    MOVE.W Y1,D2       ; Y départ
    MOVE.W X2,D3       ; X fin
    MOVE.W Y2,D4       ; Y fin
    JSR DRAW_FILL_ELIPSE
    BRA DESSIN_BOUCLE
;-----------------------------------   
    
    

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
    BLT check_nouveau
    CMP.W #335,D3        ; X max
    BGT check_nouveau
    CMP.W #5,D2          ; Y min
    BLT check_nouveau
    CMP.W #40,D2         ; Y max
    BGT check_nouveau
        
    
    MOVE.B #3,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL
    
    
    
check_nouveau:
    CMP.W #560,D3        ; X min
    BLT check_formes
    CMP.W #634,D3        ; X max
    BGT check_formes
    CMP.W #5,D2          ; Y min
    BLT check_formes
    CMP.W #40,D2         ; Y max
    BGT check_formes
    MOVE.B #3,OUTIL_ACTUEL
    JSR affichage

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
    
 
    ;cercle
    
    CMP.W #13,D2          ; Y min
    BLT FIN_CHOIX_OUTIL
    CMP.W #33,D2          ; Y max
    BGT FIN_CHOIX_OUTIL

    CMP.W #342,D3        ; X min cercle
    BLT FIN_CHOIX_OUTIL
    CMP.W #362,D3        ; X max
    BGT rect
    MOVE.B #5,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL
    
rect:
    CMP.W #367,D3        ; X min rect 
    BLT FIN_CHOIX_OUTIL
    CMP.W #387,D3        ; X max
    BGT fill_rect
    MOVE.B #2,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL
    
fill_rect:
    CMP.W #392,D3        ; X min rect fill
    BLT FIN_CHOIX_OUTIL
    CMP.W #412,D3        ; X max
    BGT fill_cercle
    MOVE.B #4,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL
    
fill_cercle:
    CMP.W #417,D3        ; X min cercle fill
    BLT FIN_CHOIX_OUTIL
    CMP.W #437,D3        ; X max
    BGT fill_cercle
    MOVE.B #6,OUTIL_ACTUEL
    BRA FIN_CHOIX_OUTIL
    


FIN_CHOIX_OUTIL:
    BRA DESSIN_BOUCLE
    
    
    
    
    
    
OUTIL_ACTUEL:   DC.B 0           ; 0=crayon, 1=gomme, 2=rectangle, 3=remplissage, 4=rectangle avec remplissage , 5=cercle, 6= cercle avec remplissage
COULEUR_ACTUEL: DC.L $F00AD025

CRAYON1:        DC.B 'CRAYON     ',0
GOMME1:         DC.B 'GOMME      ',0
FORME:        DC.B 'FORMES       ',0
REMPLISSAGE1:   DC.B 'REMPLISSAGE',0
FORME_ETAPE: DC.B 0   ; 0 = 1er clic, 1 = 2e clic

X1: DC.W 0 
Y1: DC.W 0
X2: DC.W 0
Y2: DC.W 0









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
