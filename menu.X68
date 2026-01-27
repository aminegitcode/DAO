*-----------------------------------------------------------
* Title      : menu
* Written by :
* Date       :
* Description: Page d'accueil 
*-----------------------------------------------------------

menu:
    JSR dessiner_menu

menu_boucle:
    MOVE.L #0,D1
    JSR GET_MOUSE          

    ; verifier clic gauche 
    MOVE.B D0,D4
    ANDI.B #1,D4
    BEQ menu_boucle          

    ; récuperer X,Y
    
    MOVE.L D1,D2          ; copier D1 dans D2
    MOVE.W D2,D3          ;  recuperer X et le stcoker dans D3
    MOVE.L #16,D7   ; mettre 16 dans D7
    LSR.L D7,D2    ; décaler D2 de 16 bits à droite

  
  

    ; bouton NOUVEAU
    CMP.W #150,D2
    BLT menu_boucle
    CMP.W #230,D2
    BGT menu_boucle

    CMP.W #170,D3
    BLT menu_boucle
    CMP.W #470,D3
    BGT menu_boucle

    ;lancer l'interface si le click est sur nouveau
    JSR affichage

    RTS

dessiner_menu:
    ; Fond blanc
    MOVE.L #$00FFFFFF,D1
    JSR SET_FILL_COLOR
    MOVE.W #0,D1
    MOVE.W #0,D2
    MOVE.W #639,D3
    MOVE.W #479,D4
    JSR DRAW_FILL_RECT

    ; texte de bienvenue
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    MOVE.L #$00FF8CFF,D1
    JSR SET_PEN_COLOR
    MOVE.W #0,D1
    MOVE.W #8,D2
    MOVE.W #639,D3
    MOVE.W #53,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    MOVE.W #$0801,D1
    JSR POS_CURS
    MOVE.L #TXT_BIENVENUE,A0
    JSR AFFCHAINE

    ; Bouton NOUVEAU
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    MOVE.L #$00FF8CFF,D1
    JSR SET_PEN_COLOR
    MOVE.W #170,D1
    MOVE.W #150,D2
    MOVE.W #470,D3
    MOVE.W #230,D4
    JSR DRAW_FILL_ELIPSE
    JSR DRAW_ELLIPSE
    MOVE.W #$200C,D1
    JSR POS_CURS
    MOVE.L #TXT_NOUVEAU,A0
    JSR AFFCHAINE

    ; Bouton OUVRIR
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    MOVE.L #$00FF8CFF,D1
    JSR SET_PEN_COLOR
    MOVE.W #170,D1
    MOVE.W #260,D2
    MOVE.W #470,D3
    MOVE.W #340,D4
    JSR DRAW_FILL_ELIPSE
    JSR DRAW_ELLIPSE
    MOVE.W #$2013,D1
    JSR POS_CURS
    MOVE.L #TXT_OUVRIR,A0
    JSR AFFCHAINE

    RTS

TXT_BIENVENUE: DC.B '        BIENVENUE DANS NOTRE LOGICIEL DE DESSIN     ',0
TXT_NOUVEAU: DC.B 'NOUVEAU DESSIN',0
TXT_OUVRIR: DC.B 'OUVRIR UN FICHIER',0




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
