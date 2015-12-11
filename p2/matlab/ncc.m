function [ ncc ] = ncc( p1,p2,x,y )
    ncc1 = 0;
    ncc2 = 0;
    ncc3 = 0;
    ncc = 0;
    
    for i=1:x
      for j=1:y
        ncc1 = ncc1 + (p1(i,j)*p2(i,j));
        ncc2 = ncc2 + (p1(i,j) * p1(i,j));
        ncc3 = ncc3 + (p2(i,j) * p2(i,j));
        ncc = ncc + ncc1/sqrt(ncc2 * ncc3);
      end
    end
end