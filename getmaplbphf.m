function mapping = getmaplbphf(samples)
%Outputs a mapping struct for uniform LBP Histogram Fourier Features
%inputs:
%samples = number of sampling points

%SEE constructhf.m for an example of usage
matlab_ver = ver('MATLAB');
matlab_ver = str2double(matlab_ver.Version);

if matlab_ver < 8
    mapping = getmaplbphf_ver7(samples);
else
    mapping = getmaplbphf_ver8(samples);
end

end

function mapping = getmaplbphf_ver7(samples)
table = 0:2^samples-1;
index   = 0;

newMax = samples*(samples-1) + 2;   %59 
table(1)= newMax-3;
table(2^samples)=newMax-2;
for i = 1:2^samples-2
    j = bitset(bitshift(i,1,samples),1,bitget(i,samples)); %rotate left
    numt = sum(bitget(bitxor(i,j),1:samples)); %number of 1->0 and 0->1 transitions

    if numt == 2  %Uniform pattern
        n=sum(bitget(i,1:samples)); %Number of 1-bits

        r=find(bitget(bitand(i,bitcmp(j,samples)),1:samples)); %Rotation index of the bit pattern
        r=mod( floor(n/2)+r , samples);
        
        index = (n-1)*samples + r;
        table(i+1) = index;
    else %Non-uniform
        table(i+1) = newMax - 1;
    end
end
samples=8;
orbits=cell(samples+2,1);
for i=1:samples-1
    orbits{i}=((i-1)*samples):(i*samples-1);
end
orbits{samples}=newMax-3;
orbits{samples+1}=newMax-2;
orbits{samples+2}=newMax-1;


mapping.table=table;
mapping.samples=samples;
mapping.num=newMax;
mapping.orbits=orbits;
end

function mapping = getmaplbphf_ver8(samples)
table = 0:2^samples-1;
index   = 0;
newMax = samples*(samples-1) + 2; 
table(1)= newMax-3;
table(2^samples)=newMax-2;
for i = 1:2^samples-2
    i_bin = dec2bin(i,samples);
    j_bin = circshift(i_bin',-1)';              %circularly rotate left
    numt = sum(i_bin~=j_bin);  
                                                    %number of 1->0 and
                                                    %0->1 transitions
                                                    %in binary string
                                                    %x is equal to the
                                                    %number of 1-bits in
                                                    %XOR(x,Rotate left(x))                                            
    if numt == 2  %Uniform pattern
        n = numel(strfind(i_bin, '1'));     %st4rfind return no vector of indices where 1 is present and numel give no of element
        r = samples + 1 -intersect(strfind(i_bin, '1'), find(i_bin~=j_bin));
        r = mod( floor(n/2)+r , samples);   %how manyshift for getting min value
        index = (n-1)*samples + r;
        table(i+1) = index;
    else %Non-uniform
        table(i+1) = newMax - 1;
    end
end

orbits=cell(samples+2,1);
for i=1:samples-1
    orbits{i}=((i-1)*samples):(i*samples-1);
end
orbits{samples}=newMax-3;
orbits{samples+1}=newMax-2;
orbits{samples+2}=newMax-1;


mapping.table=table;
mapping.samples=samples;
mapping.num=newMax;
mapping.orbits=orbits;
end