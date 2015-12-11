function [ ssd ] = SumOfSqaureDifferences( i1,i2,p1,p2,x,y,w1,w2 )
    ssd = 0;
    
    p1(1) = p1(1)-y/2;
    p1(2) = p1(2)-x/2;
    p2(1) = p2(1)-y/2;
    p2(2) = p2(2)-x/2;
    for i=1:x
      for j=1:y
        ssd = ssd + (i1(w1(4)+p1(1)+j,w1(3)+p1(2)+i)...
            -i2(w2(4)+p2(1)+j,w2(3)+p2(2)+i))^2;
      end
    end
end

