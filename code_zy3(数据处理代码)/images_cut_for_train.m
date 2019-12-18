
clear all 
clc
tic

% %%
str1='E:\RemoteSensingData\ZY3\ÔÆÑ©Êý¾Ý20191005\20191011-zy3\cloud_snow_labels';
str_img='\images\';
str_label='\labels_1_2_3\';
% str_label='\argument_gray_labels\';
str2='*.jpg';
str_tif='.png';
%train images
str3=[str1 str_img str2];
files1 = dir(str3);
[m,n]=size(files1);

%train labels
str4=[str1 str_label '*.png'];
files2 = dir(str4);


f1=[str1 '\train_image_sub\'];
mkdir(f1);% create a document to save the sub image
f2=[str1 '\train_labels_1_2_3_sub\'];
mkdir(f2);% create a document to save the sub labels

k=0;
for i=1:m
    str7=files1(i).name; 
    img0=imread([str1 str_img str7]);% train image
%     figure;imshow(img0);
    
    str_name=str7(1:length(str7)-4);% same name with images
    
    str8=[str_name  str_tif]; %label name
    
    img_label=imread([str1 str_label str8]);% train label
%      figure;imshow(img_label);
    str9=str7(1:length(str7)-4);% 
    str10=str8(1:length(str8)-4);% 
    [h1,h2,h3]=size(img0);   
    r=160;
%         r1=floor(h1/r);
%         r2=floor(h2/r);
        
        zy3_img={};zy3_label={};
        
        
        for b1=1:5
             for b2=1:5
                   %zy3_img{b1,b2}=img0( ((b1-1)*r+1):b1*r,((b2-1)*r+1):b2*r,:);
                   zy3_img{b1,b2}= img0( (b1*r+1-r):(b1+1)*r,(b2*r+1-r):(b2+1)*r,:);
                   str_b1=num2str(b1);str_b2=num2str(b2);
                   str11=[f1 str9 str_b1 str_b2 '.jpg'];%              
                   imwrite(uint8(zy3_img{b1,b2}), str11); 

                   %zy3_label{b1,b2}=img_label(((b1-1)*r+1):b1*r,((b2-1)*r+1):b2*r,:);
                   zy3_label{b1,b2}=img_label( (b1*r+1-r):(b1+1)*r,(b2*r+1-r):(b2+1)*r,:);
                   str12=[f2 str10 str_b1 str_b2  '.png'];              
                   label0=uint8(zy3_label{b1,b2});
                   w=size(label0,3);
                   if  w==3
                       label0=uint8(rgb2gray(label0));
                   else
                       label0=uint8(label0);
                   end
                   imwrite(label0, str12); 
             end
        end
    
    k=k+1;  
end
toc
















