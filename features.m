%% MLE
% Elapsed time 
clc
a=imread('1.jpg');
imshow(a);
figure(2);
a1=imread('1_2.jpg');
imshow(a1);
[m,n,~]=size(a);
[m1,n1,~]=size(a1);
b=zeros(m,2);
c=zeros(m,2);
d=zeros(m,2);

b1=zeros(m,2);
c1=zeros(m,2);
d1=zeros(m,2);



for i=1:n
    %image 1
    b(i,:)=mle(a(:,i,1)/255);
    c(i,:)=mle(a(:,i,2)/255);
    d(i,:)=mle(a(:,i,3)/255); 
    
    %image 2
    b1(i,:)=mle(a1(:,i,1)/255);
    c1(i,:)=mle(a1(:,i,2)/255);
    d1(i,:)=mle(a1(:,i,3)/255); 
end

disp('mean');

disp(norm(b(:,1)-b1(:,1)));
disp(norm(c(:,1)-c1(:,1)));
disp(norm(d(:,1)-d1(:,1)));

disp('var');
disp(norm(b(:,2)-b1(:,2)));
disp(norm(c(:,2)-c1(:,2)));
disp(norm(d(:,2)-d1(:,2)));
tic;toc


%% Circularity ratio

a=imread('DELL.jpg');
bin=im2bw(a);
bw1=bwperim(bin);
area=bwarea(bin);
peri=sum(sum(bw1));
c_r=4*pi*area/(peri*peri);

disp('Circularity ratio')
disp(c_r);

tic; toc


%%------Entropy-----

features(1,7)=entropy(Image);
features(1,8)=entropy(rgb2gray(Image));
features(1,9)=entropy(im2bw(Image));
features(1,10)=entropy(temp);

%--Perimeter--%
features(1,11)=sum(sum(bwperim(im2bw(Image,0.7))));
features(1,12)=sum(sum(bwperim(im2bw(temp,0.7))));


%------Erosion & dilation------------%


a=imread('test1.jpg');
b=rgb2gray(a);
c=gray2bin(b,'qam',16);
sel=strel('disk',1);
d=imdilate(c,sel);
imshow(c), title('Original')
figure, imshow(d), title('Dilated')
