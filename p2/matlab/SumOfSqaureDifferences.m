function [ ssd ] = SumOfSqaureDifferences( p1,p2,x,y )
    ssd = 0;

    for i=1:x
      for j=1:y
        ssd = ssd + (p1(i,j)-p2(i,j))^2;
      end
    end
end

