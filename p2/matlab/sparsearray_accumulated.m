x = [1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16]; 
y = [1 2 3;4 5 6;7 8 9];

[i1,j1] = ndgrid(1:size(x,1),1:size(x,2));
[i2,j2] = ndgrid(1:size(y,1),(1:size(y,2))+size(x,2));
z = accumarray([i1(:),j1(:);i2(:),j2(:)],[x(:);y(:)]);


