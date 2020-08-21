function featurevectors=constructhf(inputvectors, map)
%construct rotation invariant features from uniform LBP histogram
%inputvectors: NxD array, N histograms of D bins each
%map: mapping struct from getmaphf

    n=map.samples;
    FVLEN=(n-1)*(floor(n/2)+1)+3;
    featurevectors=zeros(size(inputvectors,1),FVLEN);
    
    k=1;
    for j=1:length(map.orbits)
        b=inputvectors(:,map.orbits{j}+1);
        if(size(b,2) > 1)
            b=fft(b')';   %discrete fourier transform
            b=abs(b);
            b=b(:,1:(floor(size(b,2)/2)+1));
        end
        featurevectors(:,k:k+size(b,2)-1)=b;
        k=k+size(b,2);
    end
