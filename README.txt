 -Commande d'un segway en employant 
 une mpu6050: juste le gyro, 
 2 moteurs FIT0450U
 une alim 5v type power bank
Problemes
 - penser a tirer du courant sur l'alim
 -Resonance inexpliquee a 10 Hz, probablement due au gyro
 - retard de 15ms dans le modele
 - zone morte de 0,5V sur les moteurs
 
calcul symbolique de modele dynamique en deplacement rectiligne
  uniquement en deplacement rectiligne, dans le dossier correspondant
   
programme 1 :calcule la commande en deplacement rectiligne, sans employer les codeurs des moteurs
 programme       : segway_rect_ygorra_H2.m
 Schema de simu  : schSegwaySimuH2.slx
 Schema arduino  : schSegwayH2Arduino.slx
  
programme 2 :calcule la commande en deplacement rectiligne en employant les codeurs des moteurs, + asservissement de rotation
 programme       : segway_rect_ygorra_H2_with_thm.m
 Schema de simu  : schSegwaySimuH2_with_thm.slx
 Schema arduino  : schSegwayH2Arduino_with_thm.slx
 
 
 

