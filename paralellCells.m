function [Cpar,Cverif]=paralellCells(C,nbCellPar)
[NC,DC]=tfdata(C,'vector');
[R,P,K]=residue(NC,DC);
Cpar=cell(length(R),1);
if length(K)==0
    K=0;
end
k=1;kc=0;
%Cpar=cell(nbCellPar,1); % on espere nbCellPar cellules maxi
while (k<=length(P))
    rP=real(P(k));iP=imag(P(k));
    rR=real(R(k));iR=imag(R(k));
    if (iP)==0
        kc=kc+1;Cpar{kc}=tf(rR,[1,-rP]);
        k=k+1;
    else
        cN=[2*rR,- 2*rP*rR - 2*iP*iR];
        cD=[1,- 2*rP,iP^2 + rP^2];
        kc=kc+1;
        Cpar{kc}=tf(cN,cD);
        k=k+2;
    end
end
if (length(K)>=0)
    kc=kc+1;
    Cpar{kc}=tf(K,1);
end
Cpar=Cpar(1:kc);
if nargin >=2
    %Cpar=cell(length(R),1);
    for k=(kc+1):nbCellPar
        Cpar{k}=tf(0,1);
    end
    Cpar=Cpar(1:nbCellPar);
end
if nargout>=2
  Cverif=tf(0,1);
  for k=1:length(Cpar)
     Cverif=Cverif+Cpar{k};
  end

end    

end