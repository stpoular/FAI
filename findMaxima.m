function [x theseis] = findMaxima(h)
% Επιστρέφει όλα τα τοπικά μέγιστα
% του ιστογράμματος h

[m n]=size(h);
x=[];
theseis=[];
prev=h(1);
up=0;
for i=2:1:n
    if(h(i)>=prev)
        up=1;
    else
        if(up==1 || i==2)
            x=[x prev];
            theseis=[theseis i-1];
            up=0;
        end
    end
    prev=h(i);
end
if(up==1) 
    x=[x prev];
    theseis=[theseis n];
end