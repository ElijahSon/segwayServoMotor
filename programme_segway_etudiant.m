clear all;close all;
nom_schema='schSimuSegway_2018a'; % nom du schema de simulation en deplacement rectiligne
CREE_SCHEMA=1; % finaliser le schema schSimuSegway_2018a.slx
LIN_SYS =1; % 1 pour lineariser le systeme sans commande
DRAW_BF=1; % 1 pour tracer les transferts sans commande
CALCULE_C =0; % 1 pour calculer le regulateur, puis le tester sur micro controleur
CALCULE_CLeftRight=0; % calcul du regulateur en rotation
SIMU_SYS=1;
LIN_BF =1; % 1 pour lineariser boucle fermee
SIMU_BF=1;
GENERE_REGULATEUR_ARDUINO=0;
ok_arduino=0;
%--------------------
%entrées et sorties 
%--------------------------
in_cb=1; 
in_cm=2;
in_um=3;
in_um=3;
%q, dq/dt
out_thb=1; 
out_thm=2;
out_vthb=3;
out_vthm=4;
w=logspace(-1,3,1000).';
TECH=0.005; % periode d'echantillonnage pour implementation sur micro controleur de arduino due (ARM7 V3 )
%-----------------------------------------------------------
%parametre par defaut 
K=zeros(1,4);%K=[0,0,0,0];% K = matrice 1 ligne 4 clonnes 

time_values_cb=[0,0];
time_values_cm=[0,0];
time_values_um=[0,0];

%------------------------------------------------------------------
% parametres des moteurs FIT0450U d'entrainement du segway en deplacement rectiligne
% dans ce cas les 2 moteurs sont attaques par la meme tension d'induit Um
%-----------------------------------------------------------------

Im=2*0.0061; % inertie de 2 moteurs en sortie de reducteur
Kem= 0.277; % rapport fcem / vitesse en sortie de reducteur :V/(rd/s)=Nm/A;

Kim=2 *0.277;% 2. rapport couple  en sortie de reducteur/ courant :Nm/A = V/(rd/s);
Rm=2.8;% resistance d'induit en ohm
fm=2* 0.0108;% frottement visqueux en sortie de reducteur
u_max=5; % tension max des moteurs
u_dead=0.6; % bande morte due au frottement sec en volt
%------------------------------------------------------------------
% parametres mecanique du segway
%-----------------------------------------------------------------
G=9.81; % acceleration gravite terrestre en m/s2
% barre
Mb= 0.277; %Masse segway sans batterie 277g
Lb =  0.056000; % distance essieu centre de masse en m
Ib=1e-4 ; % inertie de la barre autour de son centre de masse en Kg.m^2
% batterie
Mbat=2*0.096; %masse en Kg des 2  batteries VoltCraft 5000 de 96g chacune
LxBat=0.022;LyBat=2*0.036;LzBat=0.075;
Ibat=1/12*Mbat*(LyBat^2+LzBat^2); % inertie batt/ centre de masse batt en kg.m2
Lbat=0.085;%0.085; % distance essieu centre de masse Batteries
%roues
Rr=0.07; % rayon des roues en m
Mr=2 * 0; % masse de 2 roues, negligable
Ir=1/2*Rr^2*Mr; % inertie des 2 roues, =1 cylindre plein de masse Mr, de rayon Rr autour de son axe de rotation


%----------------------------------------------------------------------------------------------------
% modele  d'un segway
% en deplacement rectiligne lorqu'on applique la meme tension d'induit Um sur les 2 moteurs...]
%--------------------------------------------------------------------------------------------------



%--------------------------------------------------------------------------------------
% linearisation avec simulink, autour du pt d'equilibre instable
%---------------------------------------------------------------------------------------
p=tf('p');
tfinal=10; % unused
thm_init=0*pi/180;vthm_init=0*pi/180;
thb_init=0*pi/180;vthb_init=0*pi/180;
%---------------------------------
% debut de votre travail
%---------------------------------
if CREE_SCHEMA==1
    % 1-executer ce programme , pour definir les variables et parametres du
    % schema simulink schSimuSegway_2018a.slx
    % 2- ouvrir le schema et completer les fonctions
    % en employant les equations du modele rappelees dans le schema simulink
    %------------------------------------------------------------------------------------------------------------------
    % Modele dynamique du segway en deplacement rectiligne
    %    A. d2q/dt2 + H = Couples cq <=>
    % <=> d2q/dt2= A^-1. [cq -H ],
    % A et H calculees dans la fonction clc_AH_gyropode_TP.m
    %-----------------------------------------------------------------------------------------------------------------
    % degres de libertes q= [ angle barre tb; angle moteurs tm  ]
    % vitesses            dq/dt= [vb                     ; vm                           ]
    % couples                  cq= [ couple barre cb; couple moteurs cm  ]
    % on rappelle que :
    % theta roue = theta moteur + theta barre
    % distance algebrique parcourue x= Rr* thetaRoue
end

if LIN_SYS==1
    %-----------------------
    % linearisation avec simulink, autour du pt d'equilibre instable
    %sauvegarde de la representation d'etat ssBO dans le fichier lin_segway_bo.mat
    %----------------------------------------
    %on definit le point d'équillibre
    thb_init=0*pi/180;
    thm_init=0*pi/180;
    vthb_init=0*pi/180;
    vthm_init=0*pi/180;
    
    [A,B,C,D]=linmod(nom_schema);
    ssBO=ss(A,B,C,D); 
    tfBO=tf(ssBO);
    save lin_segway_bo.mat ssBO;
end

if DRAW_BF==1
    

    load lin_segway_bf.mat;
    ss_thm_um=ssBF(out_thm,in_um);%statespace : sortie 1 <- thb entree 3 <- um  
    %tf_thm_um=tf(ss_thb_um);%conversion en fonction de transfert  
    figure;
    % trace des transferts en BO :
    %thb<-um
    tf_thm_um=tf(ssBF(out_thm,in_um));
    tf_thb_um=tf(ssBF(out_thb,in_um));
    tf_vthm_um=tf(ssBF(out_vthm,in_um));
    tf_vthb_um=tf(ssBF(out_vthb,in_um));
    bode(tf_vthm_um*180/pi,w);
    subplot(4,1,1); my_bodemag(180/pi*tf_thb_um);title('thb(deg) <- um'); 
    subplot(4,1,2); my_bodemag(180/pi*tf_thm_um);title('thm(deg) <- um'); 
    subplot(4,1,3); my_bodemag(180/pi*tf_vthb_um);title('vthb/dt(deg) <- um'); 
    subplot(4,1,4); my_bodemag(180/pi*tf_vthm_um);title('vthm/dt(deg) <- um'); 
end

if CALCULE_C==1
    load lin_segway_bo.mat;
    A=ssBO.A; B=ssBO.B; C=ssBO.C; D=ssBO.D; 
    if max(size(ssBO.A))~=4
        error('eigen values  assignment prevu uniquement sur modele idealise d ordre 4, revoir linearisation');
    end
    %----------------------------------------------------------------
    % Calcul d'une variante du placement de poles quant on mesure
    % tout l'etat x=[thetab;thetam;dthetab/dt;dthetam/dt] du systeme :
    % commande um=-K.x,
    % ou plutot um=-K.xmesure, avec xmesure = x+ bruitx
    % soit A,B,C,D la representation d'teta du systeme linearise
    % on peut employer la commande matlab K=place(A,B,poles) pour calculer le
    % gain K
    %-------------------------------------------------
    % ' mauvais ' choix de poles
    %-------------------------------------------------
    poles_BF=[-1,-6,-7.9,-4.4];
    M2=[0;0;1];
    BUm=B*M2; 
    K=place(A,BUm,poles_BF);
    %---------------------------------------------------------------------------------
    % analyse des performances obtenues
    % trace des bode du systeme linearise, sans utiliser le schema
    % dx/dt = A.x + B. u ,
    %
    % FTBO
    % x <-pertUm 
    % Um <- bruitx
    % thetaM <-bruitx
    %-------------------------------------------------------------------------------
    results_LQR=cell(0);
    s=struct;
    s.A=A;s.B=B;
    figFTBO=figure();
    figUbx=figure();
    figxPertU=figure();
    figThmbx=figure();
    save Kplace.mat K; 
    
end
if CALCULE_CLeftRight==1
    % optionnel : calcul du regulateur left right
    Kilr=Kim/2; Imlr=Im/2;fmlr=fm/2; 
    GLeftRight=Kim/2/(Rm*(Imlr*p+fmlr)+Kem*Kilr); % 1 seul moteur ici
    GLeftRight=GLeftRight/p;
    [mgGlr,dgGlr]=bode(GLeftRight,w);mgGlr=mgGlr(:);dgGlr=dgGlr(:);
    wulr=30; % wu = 30 rd/s, on peut monter jusqu'a 70
    [NG,DG]=tfdata(GLeftRight,'vector'); 
    poles_BF=wulr/sqrt(2)*[-1+1i,-1-1i,-2];
    DBF=poly(poles_BF); 
    [NumC,DenC]= plcpol(DG , NG , DBF, 1 , 1 ) ;
    tfCLeftRight=tf(NumC,DenC);
    FTBO=tfCLeftRight*GLeftRight; 
    figure; 
    bode(FTBO); grid on; hold on; title('Bode FTBO'); 
    %-------------------------------------------------------------------------------
    % votre travail : calcul du regulateur left right
    %--------------------------------------------------------------------------------
    tfClr=1/p; % fct de transfert du regulateur
    ssCpLeftRight=ss(tfClr);
    ssCzLeftRight=c2d(ssCpLeftRight,TECH,'tustin');
    save CzLeftRight.mat ssCzLeftRight;
end

if GENERE_REGULATEUR_ARDUINO==1,
    load segway_controlled.mat; % recuperation des resultats de calcul du regulateur
    Te=5e-3;SG.TECH=Te;
    SG.K=K;
    
    save segway_controlled.mat SG;
end
if LIN_BF==1

    % Creation : par enrichissement du schema schSimuSegway2018a
    % puis linearisation du schema en boucle fermee
    load lin_segway_bf.mat; %lecture de ssBF et K 
    load Kplace.mat; % recuperation des resultats de calcul du regulateur
        thb_init=0*pi/180;
    thm_init=0*pi/180;
    vthb_init=0*pi/180;
    vthm_init=0*pi/180;
    
    [A,B,C,D]=linmod(nom_schema);
    ssBF=ss(A,B,C,D); 
    tfBF=tf(ssBF);
    save lin_segway_bf.mat ssBF;
    eig(ssBF.A) %--> pomes des fonctions de transfert 
    save lin_segway_BF.mat ssBF %sauvegarde segway en BF 
end
% QUESTION 5
if SIMU_BF==1
    % simulation du systeme en boucle fermee,
    % en ajoutant les imperfections au fur et a mesure
    load Kplace.mat; % recuperation des resultats de calcul du regulateur
    tfinal=7;
    
    
end

% QUESTION 5
if SIMU_SYS==1
    % simulation du systeme
    thm_init=1*pi/180;
    vthm_init=0*pi/180;
    thb_init=1*pi/180;
    vthb_init=0*pi/180;
    time_values_um=[0,0;0.1,0;0.1,5;0.2,5;0.2,0;1e9,0];
    simOut=sim(nom_schema); 
    [t,x,y]=sim(nom_schema); 
    figure()
    subplot(3,1,1);plot(t,180/pi*y(:,out_thm)); grid on; hold on; title('thm(deg)=f(t)');
    subplot(3,1,2);plot(y(:,out_um)); grid on; hold on; title('um(deg)=f(t)');
    subplot(3,1,3);plot(t,180/pi*y(:,out_thb)); grid on; hold on; title('thb(deg)=f(t)');
    
end
%------------------------------------------------------------------------------------------------------------
% fonction 'ad hoc' pour tracer le gain d'un diagramme de bode
% sur le graphique courant
%------------------------------------------------------------------------------------------------------------

function my_bodemag(sys,w_in)
if nargin >=2
    [mg,dg,w]=bode(sys,w_in);
else
    [mg,dg,w]=bode(sys);
end
mg=mg(:);db=20*log10(mg);
semilogx(w,db);grid on;hold on; 

end
