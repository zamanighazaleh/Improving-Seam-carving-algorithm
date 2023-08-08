function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
B = zeros(size(energyImg,1),size(energyImg,2),3);
B(:,:,3) = energyImg;

energyImg(2:end,1)=inf;
energyImg(2:end,end)=inf;

verticalSeam = find_vertical_seam(energyImg);

for i=1:length(verticalSeam)
    im(i,verticalSeam(i):end-1,:)=im(i,verticalSeam(i)+1:end,:);
    B(i,verticalSeam(i),1) = 255;
end

for i=1:length(verticalSeam)
    energyImg(i,verticalSeam(i):end-1)=energyImg(i,verticalSeam(i)+1:end);
end
%imshow(B,[]);
reducedColorImg=im(:,1:end-1,:);
reducedEnergyImg=energyImg(:,1:end-1);

