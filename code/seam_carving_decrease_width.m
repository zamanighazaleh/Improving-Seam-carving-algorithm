clear all
clc

im=imread('Input/Diana.png');
ground_truth = im2double(imread('Input/Diana_DMap.png'));


h = size(im,1);
w = size(im,2);

t = (max(max(ground_truth)) - min(min(ground_truth)))*0.5;
GG = zeros(size(im,1),size(im,2));
for i=1:size(im,1)
    for j=1:size(im,2)
        if(ground_truth(i,j) > t)
            GG(i,j) = 1;
        end
    end
end

if(sum(sum(GG))/(w*h) > 0.5)
    J = imresize(im,[h 0.8*w]);
    NG = imresize(ground_truth,[h 0.8*w]);
    cc = size(im,2) - size(J,2);
    left_cols = size(im,2)/2 - cc;
    
    nim=J;
    nen=NG;
    for i=1:left_cols
        [nim,nen] = decrease_width(nim,nen);
    end
else
    
    nim=im;
    nen=ground_truth;
    for i=1:w/2
        [nim,nen] = decrease_width(nim,nen);
    end
end

imwrite(nim,'Output/diana_output.png');
figure;imshow(im);title('Original image');
figure;imshow(nim);title('50% width decreased');


