
clear all 
clc
tic

% %%
str1='D:\论文实验结果\zy3-test_imag_labels\images\';
str2='*.jpg';
str3=[str1 str2];
files1 = dir(str3);
[m,n]=size(files1);


f1='D:\论文实验结果\zy3-test_imag_labels\images_sub\';
mkdir(f1);% create a document to save the sub image

k=0;
for i=1:m
    str7=files1(i).name; %
    img0=imread([str1 str7]);% test_images
    str8=str7(1:length(str7)-4);% 
    [h1,h2,h3]=size(img0);    
    
    if h1<2000
          r=513;
          k0=2;
          zy3_img={};zy3_label={};
           for b1=1:k0
               for b2=1:k0
                   zy3_img{b1,b2}=img0( ((b1-1)*r+1):(b1*r),((b2-1)*r+1):(b2*r),:);
                   str_b1=num2str(b1);str_b2=num2str(b2);
                   str11=[f1 str8 str_b1 str_b2 '.jpg'];%              
                   imwrite(uint8(zy3_img{b1,b2}), str11); 
               end
           end
           k=k+1;
    else
        r=503;
        k0=6;
        zy3_img={};zy3_label={};
        if (r*k0<h1)||(r*k0<h2)
            img0=imresize(img0,[r*k0+2,r*k0+2]);
        end
        % detect wether it is RGB image
        if h3==1
            img_rgb=uint8(zeros(r*k0+2,r*k0+2,h3));
            img_rgb=rgb2gray(img0);
        else
            img_rgb=img0;
        end
  
           for b1=1:k0
               for b2=1:k0
                   zy3_img{b1,b2}=img_rgb( ((b1-1)*r+1):(b1*r),((b2-1)*r+1):(b2*r),:);
                   str_b1=num2str(b1);str_b2=num2str(b2);
                   str11=[f1 str8 str_b1 str_b2 '.jpg'];%              
                   imwrite(uint8(zy3_img{b1,b2}), str11); 
               end
           end
    end
    
end
toc








