function [ ncc ] = ncc( p1,p2,pp1,pp2,x,y,w1,w2 )
    
    
    pp1(1) = pp1(1)-y/2;
    pp1(2) = pp1(2)-x/2;
    pp2(1) = pp2(1)-y/2;
    pp2(2) = pp2(2)-x/2;
    
    dim1 = size(p1);
    dim2 = size(p2);
    
    w1xmin = w1(3);
    w1ymin = w1(4);
    w2xmin = w2(3);
    w2ymin = w2(4);
    
    
    p1x = pp1(2);
    p1y = pp1(1);
    p2x = pp2(2);
    p2y = pp2(1);
    
    ip1x = w1xmin+p1x;
    ip1y = w1ymin+p1y;
    ip2x = w2xmin+p2x;
    ip2y = w2ymin+p2y;


    ncc1 = 0;
    ncc2 = 0;
    ncc3 = 0;
    ncc = 0;
    
    for i=1:x
      for j=1:y
        ncc1 = ncc1 + (p1(ip1y+i,ip1x+j)*p2(ip2y+i,ip2x+j));
        ncc2 = ncc2 + (p1(ip1y+i,ip1x+j) * p1(ip1y+i,ip1x+j));
        ncc3 = ncc3 + (p2(ip2y+i,ip2x+j) * p2(ip2y+i,ip2x+j));
        ncc = ncc + ncc1/sqrt(ncc2 * ncc3);
      end
    end
end