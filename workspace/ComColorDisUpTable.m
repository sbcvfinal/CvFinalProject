%string Color
function dis = ComColorDisUpTable(c1,c2,ColorDisHash,lamda ,option)

if option == 1
            %save c1 and c2
        tempc1= c1;
        tempc2= c2;
        
        %compute the c1 c2 distance and save the distance
        s= TwoColor2String(tempc1,tempc2);
        tempc1 =double( tempc1-1)/255.0;
        tempc2 =double( tempc2-1)/255.0;
        
        distance =   (lamda^2).*(dot(c1-c2,c2)/(norm(c2))^2)+norm(      c1-(dot(c1,c2).*(c2/(norm(c2))^2) )      );
        ColorDisHash.put(s,distance);
        
        
        for i = -1:0
            for j= -1:0
                tempc1= c1+(-1)^i;
                tempc2= c2+(-1)^j
                s= TwoColor2String(tempc1,tempc2);
                ColorDisHash.put(s.distance);
            end
        end
        
    
else if option ==2
        
        
        %save c1 and c2
        tempc1= c1;
        tempc2= c2;
        
        %compute the c1 c2 distance and save the distance
        s= TwoColor2String(tempc1,tempc2);
        tempc1 =double( tempc1-1)/255.0;
        tempc2 =double( tempc2-1)/255.0;
        
        distance =   (lamda^2).*(dot(c1-c2,c2)/(norm(c2))^2)+norm(      c1-(dot(c1,c2).*(c2/(norm(c2))^2) )      );
        ColorDisHash.put(s,distance);
        
        %compute nearby distance and save the nerighbor value
        for i = -1 :0
            for j = -1:0
                for k = -1:0
                    for l = -1:0
                        for m= -1:0
                            for n= -1:0
                                
                                tempc1=[c1(1)+(-1)^i c1(2)+(-1)^j c1(3)+(-1)^k];
                                tempc2= [c2(1)+(-1)^l c2(2)+(-1)^m c2(3)+(-1)^n];
                                
                                s= TwoColor2String(tempc1,tempc2);
                                ColorDisHash.put(s,distance);
                                
                            end
                        end
                    end
                end
            end
        end
    end
end








