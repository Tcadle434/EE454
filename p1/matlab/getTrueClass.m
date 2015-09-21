function testtrueclass = getTrueClass(testimageset)
    temp = size(testimageset);
    numImages = temp(4);
    testtrueclass = zeros(1,numImages);
    for i = 1:numImages
        if 1<=i && i<=10
            testtrueclass(1,i) = 1;
        end
        if 10<i && i<=20
            testtrueclass(1,i) = 2;
        end
        if 20<i && i<=30
            testtrueclass(1,i) = 3;
        end
        if 30<i && i<=40
            testtrueclass(1,i) = 4;
        end
        if 40<i && i<=50
            testtrueclass(1,i) = 5;
        end
        if 50<i && i<=60
            testtrueclass(1,i) = 6;
        end
        if 60<i && i<=70
            testtrueclass(1,i) = 7;
        end
        if 70<i && i<=80
            testtrueclass(1,i) = 8;
        end
        if 80<i && i<=90
            testtrueclass(1,i) = 9;
        end
        if 90<i && i<=100
            testtrueclass(1,i) = 10;
        end
        if 100<i && i<=110
            testtrueclass(1,i) = 11;
        end
        
    end
end