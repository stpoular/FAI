function [a b c d] = logicalFunctionTeams(p)
% LOGICALFUNCTIONTEAMS Implements the 4 logical functions (Eq. 3 in text)
% a = xz
% b = yw
% c = y'z'
%
%[a b c d] = logicalFunctionTeams(p)
% p 1x4

x = logical(p(1));
y = logical(p(2));
z = logical(p(3));
w = logical(p(4));

a = x & z;
b = y & w;
c = ~y & ~z;
d = (~x & y & ~w) | (x & z & w);

end
