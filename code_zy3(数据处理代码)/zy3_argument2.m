clear all 
clc
tic

% %%
str1='E:\RemoteSensingData\ZY3\云雪数据20191005\images_cloud_snow';
str_img='\images\';
str_label='\labels\';

% str2='*.png';
%train images
str3=[str1 str_img '*.jpg'];
files1 = dir(str3);
[m,n]=size(files1);
%train labels
str4=[str1 str_label '*.png'];
files2 = dir(str4);


f1=[str1 '\argument_train_sub\'];
mkdir(f1);% create a document to save the sub image
f2=[str1 '\argument_labels_sub\'];
mkdir(f2);% create a document to save the sub labels



f3=[str1 '\argument_train_sub2\'];
mkdir(f3);% create a document to save the sub image
f4=[str1 '\argument_labels_sub2\'];
mkdir(f4);% create a document to save the sub labels

for i=1:m
    str5=files1(i).name; %图片的名称
    str6=[str1 str_img str5]; % 图片路径
    img0=imread(str6); 
    
%     str7='mask' ;
    str8=str5(1:length(str5)-4); 
    str9='.png';
    
    str10=[str1 str_label str8  str9];% labels
    
    label0=imread(str10); % labels
    
    % %  获取图像和标签的名称
    str11=str5(1:length(str5)-4); %image name
    str12=str8; %label name
   %%  
    %%
    %图像镜像处理
    img_3=flip(img0,1);%原图像的水平镜像
    img_4=flip(img0,2);%原图像的垂直镜像
    
    lab_3=flip(label0,1);%原标签的水平镜像
    lab_4=flip(label0,2);%原标签的垂直镜像
    
%     str15='_h';
%     str16='_v';
%     
%     str_5=[f1 str11  str15 '.jpg']; %图片保持路径
%     str_6=[f1 str11  str16 '.jpg'];
%     imwrite(img_3,str_5);
%     imwrite(img_4,str_6);
%     
%     str_7=[f2 str12  str15 '.png']; %标签保持路径
%     str_8=[f2 str12  str16 '.png'];
%     imwrite(lab_3,str_7);
%     imwrite(lab_4,str_8);
    
  %%  
    %img=flipdim(img,2); % 1 水平镜像； 2 垂直镜像；
    img_5= imrotate(img0,20,'bicubic','crop'); %旋转
    img_6= imrotate(img0,50,'bicubic','crop'); %旋转   
    
    lab_5= imrotate(label0,20,'bicubic','crop'); %旋转
    lab_6= imrotate(label0,50,'bicubic','crop'); %旋转
    
    str25='_r20';
    str26='_r50';  
    
    str_9=[f3 str11  str25 '.jpg']; %图片保持路径
    str_10=[f3 str11  str26 '.jpg'];
    imwrite(img_5,str_9);
    imwrite(img_6,str_10);
    
    str_11=[f4 str12  str25 '.png']; %标签保持路径
    str_12=[f4 str12  str26 '.png'];
    imwrite(lab_5,str_11);
    imwrite(lab_6,str_12);    
%     
%     %原始图像保存
%     str_13=[str6 str7 '.jpeg']; %图片保持路径
%     imwrite(img0,str_13);
    
end

toc











