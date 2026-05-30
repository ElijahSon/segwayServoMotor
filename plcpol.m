function [NumC,DenC]= plcpol(DG , NG , DBF, NCforce , DCforce ) ;
%function [NumC,DenC]= plcpol(DG , NG , DBF, NCforce , DCforce ) ;
% Appel Typique    :
%        [NC,DC]=plcpol(DG,NG,DBF,1,[1,0]); on veut une integration
% Remarque DBF Doit etre de degre suprieur ou egal a 2.DG + NCforce + DCforce

  if (nargin == 3 ),
    NCforce =[1] ; DCforce =[1] ;
  end
  if (nargin == 4 ),
    DCforce =[1] ;
  end
  NA =max(size(DG ))-1;NB =max(size(NG )) - 1;
  NRf=max(size(NCforce))-1;NSf=max(size(DCforce)) - 1;
  NP =max(size(DBF ))-1;
  if ( NP < ( 2 * NA + NRf + NSf ) ) | ( NP == 0 ),
  %  error([' DBF doit etre d''ordre >= a ',num2str(2 * NA + NRf + NSf) ] ) ;
  end
% * Normalisation : DCforce(NSf) = 1 , DG(Na) = 1 , DBF(Np) = 1 ***}
  DCforce =DCforce / DCforce(1) ;
  NCforce =NCforce / NCforce(1 );
  NG = NG  / DG(1)  ;
  DG = DG  / DG(1)  ;
  DBF = DBF  / DBF(1)  ;
% ** Determination des ordres ***}
  NR    = NA + NSf - 1 ;
  NS    = NP - NSf - NA;
%  NSMin = NA + NRf
  DenC=zeros(1,NS+1) ; DenC(1) = 1 ;
% * Determination de Af = DG * DCforce , Bf = NG * NCforce ***}
  Af = conv ( DG , DCforce ) ; Bf = conv( NG , NCforce ) ;
  NAf=max(size(Af))-1;NBf=max(size(Bf)) - 1;
% * formation de la matrice M du placement de poles **}
  M = zeros( NP,NP ) ;
  V = zeros( NP, 1 ) ; 
  for i = 0:NP-1,  %  i : coeff de DBF(i) <=> Lignes de M **}
  % * Vecteur V(i) de l equation M . X = V = coeff DBF(i) **}
    V( i + 1 ) = DBF(NP+1-i) ;
  % * on s'occuppe des coeffs de Af . DenC **}
    for j = 0:NS,  %  j est le coeff de DenC(j)  *}
      k = i - j ;                 %  k est le coeff de Af(k) *}
      if ( k >= 0 ) && ( k <= NAf ),
        Trv = Af( NAf+1-k );
      else                  
        Trv = 0 ;
      end
      if ( j < NS ),
         M( i + 1 , j + 1 ) = Trv ;
      else 
        V( i + 1 ) = V( i + 1 ) - Trv ;
      end
    end
  % * on s occuppe des coeffs de Bf . NumC **}
    for j = 0:NR,  %  j est le coeff de NumC(j)  *}
      k = i - j ;  %  k est le coeff de Bf(k) *}
      if ( k >= 0 ) && ( k <= NBf ) ,
        Trv = Bf( NBf + 1 - k );
      else                  
        Trv = 0;
      end
      M( i + 1 , j + NS + 1 ) = Trv ;
    end
  end
% * Solution = M-1. V [s0..sn-1],[r0,rnr] **}
  Sols = pinv(M) * V ;
%* Solution du probleme  | DenC[0..NS-1] |     -1        *
%*                         |            | = M   * V     *
%*                         | NumC[0..NR ]  |               *}
  DenC= [ 1;Sols(NS:-1:1) ];
  NumC= Sols(NS+NR+1:-1:NS+1);
  DenC =conv(DenC,DCforce); NumC = conv(NumC,NCforce);
  [n,m]=size(DenC);
  if n>1,
    DenC=DenC';
  end
  [n,m]=size(NumC);
  if n>1,
    NumC=NumC';
  end
end
