%change absorption rate of the little ball
clear
load data
M(256,256,71)=0;
P(258,258,71)=0;

for k=1:71;
    M(:,1:166,k)=A(:,1:166);
    M(:,200:258,k)=A(:,198:256).*k;                           %give value to 30 matrixes
    
    N(:,:,k)=radon(M(:,:,k));    %相图
    P(:,:,k)=reebuild(N(:,:,k));
    [a,b]=find(P(:,1:166,k)==max(max(P(:,1:166,k))));
    d(k)=((a-129.5)^2+(b-129.5)^2)^0.5;
end

 plot(1:71,d,'*')
 xlabel('小圆吸收率')
 ylabel('几何中心偏移（像素）')
