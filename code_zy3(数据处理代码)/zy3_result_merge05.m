
clear all 
clc
tic

% %%

file1='C:\Users\Administrator\Desktop\labels\'; % sub-labels for merge

%%
original_img=importdata('D:\论文实验结果\zy3\test_img\1224\test_image.txt'); % original big images names
m0=length(original_img); % number of the big images
file2='D:\论文实验结果\zy3\test_img\1224\images\';  % original big images load path
%%

str0='11';
sub_str_blod_png='_blob_0.png';
sub_str2='.jpg';

sub_img_rgb=[];
sub_img_labels=[];

f1='C:\Users\Administrator\Desktop\labels_add\';
mkdir(f1);% create a document to save the merged image

d=4;

for i=1 :m0

   str2=original_img{i};
   img_rgb0=imread([file2 str2 str0 sub_str2]); % read 11 rgb sub-images, get the images size
   [k1,k2,k3]=size(img_rgb0); % the image size will be useed in following compution
   
   %%
    % image merge for 1k * 1k

   if k1==513
       img_rgb=uint8(zeros(2*k1,2*k1,3));
       img_labels=uint8(zeros(2*k1,2*k1,1));
       for h1=1:2
           for h2=1:2
               %%%
               str_h1=num2str(h1);str_h2=num2str(h2);
               str3=[str_h1 str_h2];
               
               %labels
               sub_img_labels_0=imread([file1 str2 str3 sub_str_blod_png]); % read labels sub-images
               
               % images dilate
               [t1,t2,t3]= size(sub_img_labels_0);
               sub_img_labels_1=uint8(zeros(t1,t2,t3));
               struct=ones(d,d);
               
               sub_img_labels_1(d:t1-d+1,d:t2-d+1,:)=sub_img_labels_0(d:t1-d+1,d:t2-d+1,:);
               sub_img_labels_0(d:t1-d+1,d:t2-d+1,:)=0;
               
               sub_img_labels_2 =imdilate(sub_img_labels_0,struct);
               sub_img_labels_2(d:t1-d+1,d:t2-d+1,:)=0;
               sub_img_labels=sub_img_labels_2+sub_img_labels_1;
               img_labels(((h1-1)*k1+1):(h1*k1),((h2-1)*k2+1):(h2*k2),:)=sub_img_labels;

           end
       end

    str11=[f1 str2 sub_str_blod_png];% 
    imwrite(255*uint8(img_labels-1), str11); 

    
    %% 
    %image merge for 3k * 3k
   else
%        k1=503;
       img_rgb=uint8(zeros(6*k1,6*k1,3));
       img_labels=uint8(zeros(6*k1,6*k1,1));
       for h1=1:6
          for h2=1:6

               str_h1=num2str(h1);str_h2=num2str(h2);
               str3=[str_h1 str_h2];
               
               %labels
               sub_img_labels0=imread([file1 str2 str3 sub_str_blod_png]); % read labels sub-images
               
               sub_img_labels_0=sub_img_labels0(1:k1,1:k1,:);
               
               % images dilate
               [t1,t2,t3]= size(sub_img_labels_0);
               sub_img_labels_1=uint8(zeros(t1,t2,t3));
               struct=ones(d,d);
               
               sub_img_labels_1(d:t1-d+1,d:t2-d+1,:)=sub_img_labels_0(d:t1-d+1,d:t2-d+1,:);
               sub_img_labels_0(d:t1-d+1,d:t2-d+1,:)=0;
               
               sub_img_labels_2 =imdilate(sub_img_labels_0,struct);
               sub_img_labels_2(d:t1-d+1,d:t2-d+1,:)=0;
               sub_img_labels=sub_img_labels_2+sub_img_labels_1;
               
               img_labels(((h1-1)*k1+1):(h1*k1),((h2-1)*k2+1):(h2*k2),:)=sub_img_labels;

               
          end
       end
    str11=[f1 str2 sub_str_blod_png];% 
    imwrite(255*uint8(img_labels-1), str11); 

       
   end
 
   
end


toc





