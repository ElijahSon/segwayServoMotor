function CzParallel = convertToParallelCells(Cz)
% be carefull:  ONLY  WORKS WITH POLES OF MULTIPLICITY <=1

tfCz=tf(Cz);
Te=tfCz.Ts;
[ny,nu]=size(tfCz);
CzParallel=cell(0);
for iu=1:nu
    [nzi,dzi]=tfdata(tfCz(:,iu),'vector');
    [r,p,K]=residue(nzi,dzi);;
    % gain
    k=1;
    if (length(K)==0)
        K=0;
    end
    if (iu==1)
        if Te>0
            CzParallel{k,1}=tf(real(K),1,Te);
        else
            CzParallel{k,1}=tf(real(K),1);
        end
        k=k+1;
    else
        if Te>0
            CzParallel{k,1}=[CzParallel{k,1},tf(real(K),1,Te)];k=k+1;
        else
            CzParallel{k,1}=[CzParallel{k,1},tf(real(K),1)];k=k+1;
        end
        
    end
    for i=1:length(p),
        ok=0;
        pi=p(i);ri=r(i);
        if imag(pi)==0,
            Nz=ri;Dz=[1,-pi];ok=1;
        end
        if imag(pi)>0,
            cri=conj(ri);cpi=conj(pi);
            % add conjugate r*, p* : F(z)= r/(z-p) + r* /(z-p*)
            % F(z) = ([r+r*]. z - [r.p* +r*.p ] )/(z2- [p+p*] z + p.p* )
            Nz=[ri+cri,-(ri*cpi+cri*pi)];
            Dz=[1,-(pi+cpi),pi*cpi];
            ok=1;
        end
        if (ok==1)
            if  Te>0
                tfCzi=tf(real(Nz),real(Dz),Te);
            else
                tfCzi=tf(real(Nz),real(Dz));
            end
            if (iu==1)
                CzParallel{k,1}=tfCzi;k=k+1;
            else
                CzParallel{k,1}=[CzParallel{k,1},tfCzi];k=k+1;
            end
        end
    end
    
end % for iu

end