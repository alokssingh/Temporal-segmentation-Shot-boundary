function [ histograms  ] = similar_blk( a, c, b, mapping )
%%
    im = rgb2hsv(a);
    im = im(:,:,3);
    im = imresize(im ,[c c]);
    after_bw = im2col(im,[b,b],'distinct')';
%%winere filter low pass filter for removing noise
for i = 1 :(c*c)/(b*b)
    a = reshape(after_bw(i,:),[b,b]);
    A1 = wiener2(a,[b b]);
    h  = lbp(A1,1,8,mapping,'h');
     h  = h/sum(h);
    histograms(i,:) = h;
end
end
