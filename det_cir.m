function res = det_cir(inp)
    inp=rgb2gray(imread(inp));
    ed=255*double(edge(inp,'canny'));
    imshow(uint8(ed));
    
    th=180;
    [si1,si2]=size(ed);
    mat=zeros(si1,si2,100);
    
     for i=1:si1
         for j=1:si2
             if(ed(i,j)==255)
                 for k=10:100
                     for ang=0:360
                         val1=floor(i-k*cos((ang*pi)/180));
                         val2=floor(j-k*sin((ang*pi)/180));
                         if(val1>=1 && val2>=1 && val1<=si1 && val2<=si2)
                             mat(val1,val2,k)=mat(val1,val2,k)+1;
                         end
                     end
                 end
             end
         end
     end
     
     res=zeros(si1,si2);
     for i=1:si1
         for j=1:si2
             for k=1:100
                 if(mat(i,j,k)>=th)
                     for ang=0:360
                         val1=floor(i-k*cos((ang*pi)/180));
                         val2=floor(j-k*sin((ang*pi)/180));
                         if(val1>=1 && val2>=1 && val1<=si1 && val2<=si2)
                             res(val1,val2)=255;
                         end
 
                     end
                end
             end
         end
     end
     figure, imshow(uiont8(res));  
end

