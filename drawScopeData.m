close all;
USE_FILE=1;
anaFFT=1;
t0=0;t1=inf; % zone de trace temporel entre t0 et t1 , par defaut de 0 a l'infini
%t0=60;t1=80; % zone de trace temporel entre t0 et t1 , par defaut de 0 a l'infini
col='r';
%----------------------------------------------------------------------------------------------------------
% Sauvegarde data et periode d'echantillonnage dans fichier horodate
%----------------------------------------------------------------------------------------------------------
if USE_FILE~=1 
    fileName=sprintf('dataSegway-%s.mat',datestr(now));
   fileName=strrep(fileName,'-','_');
fileName=strrep(fileName,' ','_');
fileName=strrep(fileName,':','-');
save(fileName,'ScopeData');
else 
    fileName='dataSegway_19_Jan_2022_12-00-48.mat';
   t0=40;t1=41.5; % zone de trace temporel entre t0 et t1 , par defaut de 0 a l'infini

    load(fileName);
end
% temps et periode d'echantillonnage
t=ScopeData.time;
TECH=min(t(2:end)-t(1:(end-1)));

%-------------------------------------
% 1- extraction des donnees de ScopeData
%-------------------------------------
t=ScopeData.time;
nbData=length(ScopeData.signals);
%----------------------------------------------------------------------------------------------------------
% interpolation des donnees de ScopeData a intervalle de temps T_ECH constant
% pour permettre d'employer la fonction de filtrage 'lsim' sur les donnees,
% ou de tracer des ffts
%----------------------------------------------------------------------------------------------------------
tq=min(t):TECH:max(t);tq=tq.';
%tq=t;
for i = 1: length(ScopeData.signals)
    sig_i = ScopeData.signals(i).values(:);
    sig_i=double(sig_i);
    sig_i=interp1(t,sig_i,tq,'linear');
    ScopeData.signals(i).values=sig_i;
end
t=tq;
ScopeData.time=t;
ul=ScopeData.signals(1).values(:); % commande moteur gauche(volts)
wtang=ScopeData.signals(2).values(:); %
wlacet=ScopeData.signals(3).values(:);% vitesse angulaire (degres /s)
ur=ScopeData.signals(4).values(:); % commande moteur droit(volts)
tickl=ScopeData.signals(5).values(:);
tickr=ScopeData.signals(6).values(:);
%------------------------------------------------------------------------------------
% dans cette partie on peut filtrer les donnees avec la fonction lsim
%--------------------------------------------------------------------------------------

%------------------------------------------------------------------------------------
% zoom sur t0<t<t1, puis trace des donnees
%--------------------------------------------------------------------------------------

k=find( (t>t0)&(t<t1));
tk=t(k);ulk=ul(k);urk=ur(k);wtangk=wtang(k);wlacetk=wlacet(k);
thmlk=tickl(k)*360/(120*32);
thmrk=tickr(k)*360/(120*32);
thmtangk=(thmlk+thmrk)/2;
utangk=(ulk+urk)/2;
% trace des donnees d'Identification
figure,
subplot(4,1,1);plot(tk,ulk,'b');grid on;hold on;plot(tk,urk,'r');plot(tk,utangk,'k');title('Um left (blue), Um right(red), en Volts,(Ul+Ur)/2 Noir');

subplot(4,1,2);plot(tk,thmlk,'b');grid on;hold on;plot(tk,thmrk,'r');plot(tk,thmtangk,'k');title('thm left (blue), thm  right(red), en degres/s');

subplot(4,1,3);plot(tk,wtangk,col);grid on;hold on;title('vitesse angulaire barre (degres/s)');
subplot(4,1,4);plot(tk,wlacetk,col);grid on;hold on;title('vitesse angulaire lacet (degres/s)');
xlabel('temps (s)')
if anaFFT==1
   lgn=length(ulk);
   
   
   FECH=1/TECH;
   f_min=2; % wotrk for f>2Hz
   fk=(0:(lgn-1))*FECH/lgn;fk=fk.';k=find(fk<FECH/2);
   fk=fk(k);
   k1=find(fk>=f_min);
   windo=ones(lgn,1);
   fft_utang=fft((utangk-mean(utangk)).*windo);
   fft_ul=fft((ulk-mean(ulk)).*windo);
   fft_thml=fft((thmlk-mean(thmlk)).*windo);
   fft_ur=fft((urk-mean(urk)).*windo);
   fft_thmr=fft((thmrk-mean(thmrk)).*windo);
    fft_thmtang=fft((thmtangk-mean(thmtangk)).*windo);
   fft_wtang=fft((wtangk-mean(wtangk)).*windo);
   fft_wlacet=fft((wlacetk-mean(wlacetk)).*windo);
   fft_ulk=fft_ul(k);fft_urk=fft_ur(k);fft_utangk=fft_utang(k);
   fft_wtangk=fft_wtang(k);fft_wlacetk=fft_wlacet(k);
   fft_thmlk=fft_thml(k);fft_thmrk=fft_thmr(k);fft_thmtangk=fft_thmtang(k);
   [tmp,k1_max]=max(abs(fft_wtangk(k1)));
   k_max=k1(k1_max);
   f_max= fk(k_max);
  
   figure;
   utang_0=fft_utangk(k_max);
   thmtang_0=fft_thmtangk(k_max);
   wtang_0=fft_wtangk(k_max);
   
   subplot(4,1,1);
   plot(fk,abs(fft_utangk),'k');grid on, hold on; plot(f_max,abs(utang_0),'r+');
   title('|fft(Um) Volt| = fct (freq Hz)');
   
   subplot(4,1,2);   
   
   plot(fk,abs(fft_thmtangk),'k');grid on, hold on; plot(f_max,abs(thmtang_0),'r+');
   db=20*log10(abs(thmtang_0/utang_0));
   dg=180/pi*angle(thmtang_0/utang_0);
   msg= sprintf( ' |fft(thm ) degre|, gain : %g db, arg: %g deg a f=%g hz',db,dg,f_max);
   title(msg); 
   subplot(4,1,3);   
   
   plot(fk,abs(fft_wtangk),'k');grid on, hold on; plot(f_max,abs(wtang_0),'r+');
   db=20*log10(abs(wtang_0/utang_0));
   dg=180/pi*angle(wtang_0/utang_0);
   msg= sprintf( ' |fft(wbarre) degre/s|, gain : %g db, arg: %g deg a f=%g hz',db,dg,f_max);
   title(msg);
end    




