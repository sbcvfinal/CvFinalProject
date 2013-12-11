%process color image

function [distance,ColorDisHash] = unit_color_dis_block(c1,c2,ColorDisHash,lamda,option)

%find c1 and c2 whether in the ColorDisHash table
%If exist renturn
%If not compute the new value and return the distance
s= TwoColor2String(c1,c2,option);

if ColorDisHash.containsKey(s)
    
    distance = ColorDisHash.get(s);
  %  disp ('I find');
    ColorDisHash = ColorDisHash;
    
else
    [distance, ColorDisHash] = ComColorDisUpTable(c1,c2,ColorDisHash,lamda,option);
    distance = distance;
    ColorDisHash = ColorDisHash;
end

end




% c1= num2str(c1,'%03d');
% c2 = num2str(c2,'%03d');
% strcat(c1,c2)

%using the hash table to save the distance of c1 and c2

% v = 0.3;
% d='hello world';
% colordishash.put(d,v);
%
% if colordishash.containsKey(d)
%     disp(colordishash.get(d));
% end
%
% x=10000;
% num2str(x,'%03d')