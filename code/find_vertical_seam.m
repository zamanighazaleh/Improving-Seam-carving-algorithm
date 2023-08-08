function verticalSeam = find_vertical_seam(cumulativeEnergyMap)

verticalSeam=zeros(size(cumulativeEnergyMap,1),1);

lastrow = cumulativeEnergyMap(end,2:end-1);

if (min(lastrow)==max(lastrow))
   [val ind] = min(sum(cumulativeEnergyMap,1));
   b = ind;
else
[a b]=min(cumulativeEnergyMap(end,:));
end

verticalSeam(end)=b;
for i=size(cumulativeEnergyMap,1)-1:-1:1
    
    choose = cumulativeEnergyMap(i,b-1:b+1);
    if all(min(choose)==max(choose))
        thiscuml = cumulativeEnergyMap(1:i,b-1:b+1);
        [val ind] = min(sum(thiscuml,2));
        if(ind==1)
            b = b-1;
        elseif(ind==3)
            b = b+1;
        end
       % b=b+bb-2;
    else
    
        [a bb]=min(cumulativeEnergyMap(i,b-1:b+1));
        b=b+bb-2;
        
    end
    
    verticalSeam(i)=b;
end


