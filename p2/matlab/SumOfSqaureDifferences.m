function [ ssd ] = SumOfSqaureDifferences( i1,i2,p1,p2,x,y,w1,w2 )
    
    ssd = double(0);
    
    p1(1) = p1(1)-y/2;
    p1(2) = p1(2)-x/2;
    p2(1) = p2(1)-y/2;
    p2(2) = p2(2)-x/2;
    
    dim1 = size(i1);
    dim2 = size(i2);
    
    w1xmin = w1(3);
    w1ymin = w1(4);
    w2xmin = w2(3);
    w2ymin = w2(4);
    
    
    p1x = p1(2);
    p1y = p1(1);
    p2x = p2(2);
    p2y = p2(1);
    
    p1x = max(p1x,1);
    p1y = max(p1y,1);
    p2x = max(p2x,1);
    p2y = max(p2y,1);
    
    ip1x = w1xmin+p1x;
    ip1y = w1ymin+p1y;
    ip2x = w2xmin+p2x;
    ip2y = w2ymin+p2y;
    
    for i=1:x
      for j=1:y
          for k=1
                if ~(ip1y + j> dim1(1) || ip1x + i > dim1(2) || ...
                       ip2y + j > dim2(1) || ip2x + i > dim2(2))
                   
                   pixel1 = i1(ip1y+j,ip1x+i,k);
                   pixel2 = i2(ip2y+j,ip2x+i,k);
                   
                   step1 = double(pixel1)-double(pixel2);
                   step2 = step1^2;
                   
                   ssd = ssd + step2;
                end
                
          end
      end
    end
end

