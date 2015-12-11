function [ ssd ] = SumOfSqaureDifferences( i1,i2,p1,p2,x,y,w1,w2 )
    ssd = 0;
    t = 0;
    p1(1) = p1(1)-y/2;
    p1(2) = p1(2)-x/2;
    p2(1) = p2(1)-y/2;
    p2(2) = p2(2)-x/2;
    
    dim1 = size(i1);
    dim2 = size(i2);
    for i=1:x
      for j=1:y
          for k=1:3
                %check this because there was an index out of bounds error
                if ~(w1(4)+p1(1)+ j > dim1(1) || w1(3)+p1(2)+i > dim1(2) || ...
                       w2(4)+p2(1)+j > dim2(1) || w2(3)+p2(2)+i > dim2(1))
                    
                   ssd = ssd + (i1(w1(4)+p1(1)+j,w1(3)+p1(2)+i,k)...
                    -i2(w2(4)+p2(1)+j,w2(3)+p2(2)+i,k))^2;     
                end
                
          end
      end
    end
end

