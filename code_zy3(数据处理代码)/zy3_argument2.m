clear all 
clc
tic

% %%
str1='E:\RemoteSensingData\ZY3\��ѩ����20191005\images_cloud_snow';
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
    str5=files1(i).name; %ͼƬ������
    str6=[str1 str_img str5]; % ͼƬ·��
    img0=imread(str6); 
    
%     str7='mask' ;
    str8=str5(1:length(str5)-4); 
    str9='.png';
    
    str10=[str1 str_label str8  str9];% labels
    
    label0=imread(str10); % labels
    
    % %  ��ȡͼ��ͱ�ǩ������
    str11=str5(1:length(str5)-4); %image name
    str12=str8; %label name
   %%  
    %%
    %ͼ������
    img_3=flip(img0,1);%ԭͼ���ˮƽ����
    img_4=flip(img0,2);%ԭͼ��Ĵ�ֱ����
    
    lab_3=flip(label0,1);%ԭ��ǩ��ˮƽ����
    lab_4=flip(label0,2);%ԭ��ǩ�Ĵ�ֱ����
    
%     str15='_h';
%     str16='_v';
%     
%     str_5=[f1 str11  str15 '.jpg']; %ͼƬ����·��
%     str_6=[f1 str11  str16 '.jpg'];
%     imwrite(img_3,str_5);
%     imwrite(img_4,str_6);
%     
%     str_7=[f2 str12  str15 '.png']; %��ǩ����·��
%     str_8=[f2 str12  str16 '.png'];
%     imwrite(lab_3,str_7);
%     imwrite(lab_4,str_8);
    
  %%  
    %img=flipdim(img,2); % 1 ˮƽ���� 2 ��ֱ����
    img_5= imrotate(img0,20,'bicubic','crop'); %��ת
    img_6= imrotate(img0,50,'bicubic','crop'); %��ת   
    
    lab_5= imrotate(label0,20,'bicubic','crop'); %��ת
    lab_6= imrotate(label0,50,'bicubic','crop'); %��ת
    
    str25='_r20';
    str26='_r50';  
    
    str_9=[f3 str11  str25 '.jpg']; %ͼƬ����·��
    str_10=[f3 str11  str26 '.jpg'];
    imwrite(img_5,str_9);
    imwrite(img_6,str_10);
    
    str_11=[f4 str12  str25 '.png']; %��ǩ����·��
    str_12=[f4 str12  str26 '.png'];
    imwrite(lab_5,str_11);
    imwrite(lab_6,str_12);    
%     
%     %ԭʼͼ�񱣴�
%     str_13=[str6 str7 '.jpeg']; %ͼƬ����·��
%     imwrite(img0,str_13);
    
end

toc











