*-----------------------------------------------------------
* Title      : DAO
* Written by :
* Date       :
* Description: programme principal
*-----------------------------------------------------------
    ORG    $1000
START: 
    JSR menu
   ; appel au menu qui gère le clic
    JSR DESSIN_BOUCLE
    JMP FINPRG
    
    INCLUDE 'dessiner.x68'
    INCLUDE 'menu.x68'
    INCLUDE 'BIBGRAPH.X68'
    INCLUDE 'BIBLIO.X68'
    INCLUDE 'BIBPERIPH.X68'
    INCLUDE 'affichage.X68'
    
 
 
    END    START 


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
