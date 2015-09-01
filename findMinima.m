function [x theseis] = findMinima(h)
% Επιστρέφει όλα τα τοπικά ελάχιστα
% του ιστογράμματος h

[m n]=size(h);
x=[];
theseis=[];
prev=h(1);
down=0;
for i=2:1:n
    if(h(i)<prev)
        down=1;
    else
        if(down==1 || i==2)
            x=[x prev];
            theseis=[theseis i-1];
            down=0;
        end
    end
    prev=h(i);
end
if(down==1) 
    x=[x prev];
    theseis=[theseis n];
end