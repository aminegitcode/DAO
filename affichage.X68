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

    ; initialiser le fond  (dessiner un rectangle qui prend la taille de tout l'ecran)
    MOVE.W #0,D1      ; point de depart (x)
    MOVE.W #0,D2      ; point de depart (y)
    MOVE.W #639,D3    ; point final (largeur x) 
    MOVE.W #479,D4    ; point final (hauteur y)
    JSR DRAW_FILL_RECT        
    
    
    ; definir la couleur du fond de la barre d'outils
    MOVE.L #$00C0C0C0,D1 
    JSR SET_FILL_COLOR 

    ; initialiser le fond de la barre d'outils
    MOVE.W #0,D1      ;X1 
    MOVE.W #30,D2       ; Y1
    MOVE.W #639,D3     ;X2
    MOVE.W #75,D4      ;Y2
    JSR DRAW_FILL_RECT         



    ; definir la couleur gris clair pour remplir le fond des boutons
    MOVE.L #$DCDCDC,D1
    JSR SET_FILL_COLOR

    
    ; definir la couleur du contour du bouton
    MOVE.L #$00000000,D1
    JSR SET_PEN_COLOR
    
    ; dessiner le contour des boutons er remplir le fond

    ;; crayon  
    MOVE.W #5,D1     ; X1
    MOVE.W #35,D2      ; Y1
    MOVE.W #40,D3     ; X2
    MOVE.W #70,D4     ; Y2
    JSR DRAW_RECT
    JSR DRAW_FILL_RECT         
    
    
    ; gomme
    MOVE.W #45,D1     ; X1
    MOVE.W #35,D2      ; Y1
    MOVE.W #80,D3     ; X2
    MOVE.W #70,D4     ; Y2
    JSR DRAW_RECT
    JSR DRAW_FILL_RECT     
 
 
    ; cercle
    MOVE.W #85,D1     ; X1
    MOVE.W #35,D2      ; Y1
    MOVE.W #120,D3     ; X2
    MOVE.W #70,D4     ; Y2
    JSR DRAW_RECT
    JSR DRAW_FILL_RECT   


   

    ; palettes de couleur 
    MOVE.W #125,D1     ; X1
    MOVE.W #35,D2      ; Y1
    MOVE.W #200,D3     ; X2
    MOVE.W #70,D4 
    JSR DRAW_RECT
    JSR DRAW_FILL_RECT   

    
    ; couleur noir
    MOVE.L #$00000,D1
    JSR SET_FILL_COLOR
    MOVE.W #128,D1     ; X1
    MOVE.W #38,D2      ; Y1
    MOVE.W #140,D3     ; X2
    MOVE.W #50,D4       ; Y2
    JSR DRAW_FILL_RECT 
    
    
    ; couleur rouge
    MOVE.L #$0000FF,D1
    JSR SET_FILL_COLOR
    MOVE.W #143,D1     ; X1
    MOVE.W #38,D2      ; Y1
    MOVE.W #155,D3     ; X2
    MOVE.W #50,D4       ; Y2
    JSR DRAW_FILL_RECT 
    
    ; couleur vert
    MOVE.L #$00FF00,D1
    JSR SET_FILL_COLOR
    MOVE.W #158,D1     ; X1
    MOVE.W #38,D2      ; Y1
    MOVE.W #170,D3     ; X2
    MOVE.W #50,D4       ; Y2
    JSR DRAW_FILL_RECT 
  
 
 
 

    
    
    
    JMP FINPRG
    INCLUDE 'BIBGRAPH.X68'
    INCLUDE 'BIBLIO.X68'
    
    
    
    
    
    
    
 



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
