%change position of the little ball
clear
load data
M(256,256,30)=0;
P(258,258,30)=0;

for k=1:71;
    M(:,1:166,k)=A(:,1:166);
    M(:,166+k-1:185+k-1,k)=A(:,234:253);                           %give value to 30 matrixes
    
    N(:,:,k)=radon(M(:,:,k));    %相图
    P(:,:,k)=reebuild(N(:,:,k),0);
    [a,b]=find(P(:,:,k)==max(max(P(:,:,k))));
    d(k)=((a-129.5)^2+(b-129.5)^2)^0.5;
end

 plot(1:71,d,'*')
 xlabel('小圆距离（像素）')
 ylabel('几何中心偏移（像素）')
