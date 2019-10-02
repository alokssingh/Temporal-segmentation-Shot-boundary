clc;
clear all;
close all;
video = VideoReader('D6.mpg');
frame =video.NumberOfFrames ;
tic
mapping = getmaplbphf(8);
I = read(video,1);
c = 60;
b = 10;
nb = (c*c)/(b*b);
temp_his =  similar_blk(I,c,b,mapping);        % for old  similar_blk(I,c,b,mapping)                         %0.62; have to 
a = [];
dis=[]; 
 %%        %%                  Stage1 Using LBP-HF   
for k = 2:frame
    k
    p = 0;
    I2 = read(video,k);
    his2 = similar_blk(I2,c,b,mapping);
    for i = 1 :nb
        histograms(1,:) = temp_his(i,:);
        histograms(2,:) = his2(i,:);
        l = constructhf(histograms,mapping);  %%Feature extraction
        l = l';
        p = p+sqrt(sum((l(:,1) - l(:,2)).^2));%% Finding disimilarity between consecutive frames
    end
    temp_his = his2;
    a = [a;p];
end 
                  %% probable cut
    cut = [];count =1;
    Th = mean(a)+(1.9*std(a));      
    t= Th/std(a);
for i= 2:length(a)-1
    if  a(i) >= Th &&((a(i)-a(i-1))>t&&(a(i)-a(i+1))>t)
        cut = [cut;i+1];
    end
    count = count+1;
end
%%                  Stage2 Using Canny
n = 4 ; sum_blocks = [];  cut2 = [];
for x = 1:length(cut)
    if(cut(x)<=5||cut(x)>=frame-4)
        continue
    end
    If = rgb2hsv(read(video,cut(x)+n));   %If = rgb2hsv(If);%        If = If(:,:,3);
    Ip = rgb2hsv(read(video,cut(x)-n));   %Ip = rgb2hsv(Ip);%         Ip = Ip(:,:,3);    
    Ipe = double(edge(Ip(:,:,3),'canny'));
    Ife = double(edge(If(:,:,3),'canny'));
    Ipe = imresize(Ipe,[60,60]);
    Ife = imresize(Ife,[60,60]);
    after_Ipe = im2col(Ipe,[10,10],'distinct')';
    after_Ife = im2col(Ife,[10,10],'distinct')';
    D2 = sqrt((sum((after_Ipe' - after_Ife').^2)));
    sum_blocks =[sum_blocks;sum(D2)];    
end

%%   Final cut
sum_blocks = sum_blocks/max(sum_blocks);
Th2 = std(sum_blocks)*2.5;  %at b = 5 Th2 = std(sum_blocks)*2;
for i=1:length(sum_blocks )
    if sum_blocks(i)> Th2
        cut2=[cut2;cut(i)];
    end
end

for j= 1:length(cut2)
    subplot(1,2,1);imshow(read(video,cut2(j)-1)); xlabel(cut2(j)-1);
    subplot(1,2,2);imshow(read(video,cut2(j))); xlabel(cut2(j));
     pause(.8)
end
