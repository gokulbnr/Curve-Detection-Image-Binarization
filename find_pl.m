function res=find_pl(inp)
    inp=double(rgb2gray(imread(inp)));
    avg=mean(mean(inp(:,:)));
    
    [si1,si2]=size(inp);
    for i=1:si1-3
        for j=1:si2-3
            temp(j)=0.02*var(var(inp(i:i+2,j:j+2)))+1.265*avg;
            
            if(temp(j)>255 && j~=1)
                temp(j)=temp(j-1);
            end
            
            if inp(i,j)>temp(j) %Binarize
                res(i,j)=1;
            else
                res(i,j)=0;
            end
            
        end
    end
    figure, imshow(res);
end