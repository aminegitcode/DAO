*-----------------------------------------------------------
* Title      : affichage
* Written by :
* Date       :
* Description: initialiser et dessiner l'interface
*-----------------------------------------------------------
affichage:   

; definir la couleur du fond
    MOVE.L #$00FFFFFF,D1
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR

; initialiser le fond (dessiner un rectangle qui prend la taille de tout l'ecran)
    MOVE.W #0,D1
    MOVE.W #0,D2
    MOVE.W #639,D3
    MOVE.W #479,D4
    JSR DRAW_FILL_RECT

; definir la couleur du fond de la barre d'outils
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR

; initialiser le fond de la barre d'outils
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    MOVE.W #0,D1        ; X début
    MOVE.W #0,D2        ; Y début collé en haut
    MOVE.W #639,D3      ; X fin
    MOVE.W #45,D4       ; hauteur de la navbar
    JSR DRAW_FILL_RECT



; definir la couleur gris clair pour remplir le fond des boutons
    MOVE.L #$DCDCDC,D1
    JSR SET_FILL_COLOR
    MOVE.L #$00000000,D1
    JSR SET_PEN_COLOR

; definir la couleur du contour du bouton
    MOVE.L #$F00AD025,D1
    JSR SET_PEN_COLOR

; dessiner le contour des boutons er remplir le fond

; crayon
    MOVE.W #5,D1
    MOVE.W #5,D2       
    MOVE.W #75,D3
    MOVE.W #40,D4      
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$0201,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    
    MOVE.L #TXT_CRAYON,A0
    JSR AFFCHAINE


; gomme
    MOVE.W #163,D1
    MOVE.W #5,D2
    MOVE.W #230,D3
    MOVE.W #40,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$1601,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    
    MOVE.L #TXT_GOMME,A0
    JSR AFFCHAINE
    
; remplissage
    MOVE.W #235,D1
    MOVE.W #5,D2
    MOVE.W #335,D3
    MOVE.W #40,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$1E01,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    
    MOVE.L #TXT_REMPLISSAGE,A0
    JSR AFFCHAINE

; FORMES
    MOVE.W #340,D1
    MOVE.W #5,D2
    MOVE.W #440,D3
    MOVE.W #40,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$2D01,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    
    
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    
    ;dessiner la forme du cercle
    MOVE.W #342,D1
    MOVE.W #13,D2
    MOVE.W #362,D3
    MOVE.W #33,D4
    JSR DRAW_ELLIPSE
    
    ; dessiner le rectangle
    MOVE.W #367,D1
    MOVE.W #13,D2
    MOVE.W #387,D3
    MOVE.W #33,D4
     JSR DRAW_RECT
    

    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    MOVE.W #392,D1        
    MOVE.W #13,D2        
    MOVE.W #412,D3      
    MOVE.W #33,D4       
    JSR DRAW_FILL_RECT
    
    MOVE.W #417,D1        
    MOVE.W #13,D2        
    MOVE.W #437,D3      
    MOVE.W #33,D4       
    JSR DRAW_FILL_ELIPSE
    
    
    
    MOVE.L #$DCDCDC,D1 ; redefinir la couleur du fond des bouttons 
    JSR SET_FILL_COLOR 
; ENREGISTRER
    MOVE.W #445,D1
    MOVE.W #5,D2
    MOVE.W #555,D3
    MOVE.W #40,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$3901,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    
    MOVE.L #TXT_ENREGISTER,A0
    JSR AFFCHAINE

; NOUVEAU
    MOVE.W #560,D1
    MOVE.W #5,D2
    MOVE.W #634,D3
    MOVE.W #40,D4
    JSR DRAW_FILL_RECT
    JSR DRAW_RECT
    
    MOVE.W #$4701,D1 ; definir la position du curseur pour le boutton
    JSR POS_CURS
    MOVE.L #TXT_NOUVEAUU,A0
    JSR AFFCHAINE




; ---------------Couleur boutons---------------

    MOVE.L #$00DCDCDC,D1
    JSR SET_FILL_COLOR

; palette de couleurs fond
    MOVE.W #79,D1
    MOVE.W #5,D2
    MOVE.W #159,D3
    MOVE.W #40,D4
    JSR DRAW_RECT
    JSR DRAW_FILL_RECT

; couleur noir
    MOVE.L #$00000000,D1
    JSR SET_FILL_COLOR
    MOVE.W #83,D1
    MOVE.W #9,D2
    MOVE.W #95,D3
    MOVE.W #21,D4
    JSR DRAW_FILL_RECT

; couleur rouge
    MOVE.L #$000000FF,D1
    JSR SET_FILL_COLOR
    MOVE.W #98,D1
    MOVE.W #9,D2
    MOVE.W #110,D3
    MOVE.W #21,D4
    JSR DRAW_FILL_RECT

; couleur vert
    MOVE.L #$0000FF00,D1
    JSR SET_FILL_COLOR
    MOVE.W #113,D1
    MOVE.W #9,D2
    MOVE.W #125,D3
    MOVE.W #21,D4
    JSR DRAW_FILL_RECT

; couleur jeune
    MOVE.L #$0000FFFF,D1
    JSR SET_FILL_COLOR
    MOVE.W #128,D1
    MOVE.W #9,D2
    MOVE.W #140,D3
    MOVE.W #21,D4
    JSR DRAW_FILL_RECT

; couleur rose
    MOVE.L #$00FF8CFF,D1
    JSR SET_FILL_COLOR
    MOVE.W #143,D1
    MOVE.W #9,D2
    MOVE.W #155,D3
    MOVE.W #21,D4
    JSR DRAW_FILL_RECT

; couleur orange
    MOVE.L #$000088FF,D1
    JSR SET_FILL_COLOR
    MOVE.W #143,D1
    MOVE.W #24,D2
    MOVE.W #155,D3
    MOVE.W #36,D4
    JSR DRAW_FILL_RECT

; couleur bleu
    MOVE.L #$00FF0000,D1
    JSR SET_FILL_COLOR
    MOVE.W #128,D1
    MOVE.W #24,D2
    MOVE.W #140,D3
    MOVE.W #36,D4
    JSR DRAW_FILL_RECT

; couleur violet
    MOVE.L #$00800080,D1
    JSR SET_FILL_COLOR
    MOVE.W #83,D1
    MOVE.W #24,D2
    MOVE.W #95,D3
    MOVE.W #36,D4
    JSR DRAW_FILL_RECT

; couleur bleu nuit
    MOVE.L #$008B4513,D1
    JSR SET_FILL_COLOR
    MOVE.W #98,D1
    MOVE.W #24,D2
    MOVE.W #110,D3
    MOVE.W #36,D4
    JSR DRAW_FILL_RECT

; couleur marron
    MOVE.L #$00191970,D1
    JSR SET_FILL_COLOR
    MOVE.W #113,D1
    MOVE.W #24,D2
    MOVE.W #125,D3
    MOVE.W #36,D4
    JSR DRAW_FILL_RECT

; couleur du texte
    MOVE.L #$00C0C0C0,D1
    JSR SET_FILL_COLOR
    JSR SET_PEN_COLOR
    MOVE.W #0,D1
    MOVE.W #450,D2
    MOVE.W #639,D3
    MOVE.W #479,D4
    JSR DRAW_FILL_RECT
        
; position du texte
    MOVE.W #$021E,D1
    JSR POS_CURS

; texte à afficher
    MOVE.L #TEXT,A0
    JSR AFFCHAINE

    RTS    
TEXT: DC.B '  Outil:                  Couleur:',0

TEXT_AIDE: DC.B '   Cliquez pour dessiner | [+] Agrandir | [-] Reduire | [GOMME] Effacer',0

TXT_CRAYON: DC.B 'CRAYON',0

TXT_GOMME: DC.B 'GOMME',0

TXT_REMPLISSAGE: DC.B 'REMPLISSAGE',0

TXT_FORMES: DC.B 'FORMES',0

TXT_ENREGISTER: DC.B 'ENREGISTRER',0

TXT_NOUVEAUU: DC.B 'NOUVEAU',0


    




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
