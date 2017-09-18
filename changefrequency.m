%change sampling frequency(in 180 degrees)
clear
load data
clear AS1 AS2 AS3
M(180:367,400)=0;
N(258,258,400)=0;


for k=1:400
    f=400-k+1;%扫描次数
    M(:,1:f,k)=radon(A,(1:f)*180/f);
    N(:,:,k)=iradon(M(:,1:f,k),(1:f)*180/f,'none');
    
    if k<399
        [a,b]=find(N(:,:,k)==max(max(N(:,:,k))));
        d(f)=((a-129.5)^2+(b-129.5)^2)^0.5;
        plot(f,d(f),'*');
        hold on
        drawnow
    end
%     imshow(N(:,:,k),gray);
%     hold on
%     plot(a,b,'*r')
%     drawnow

end    
% plot(2:180,d);
xlabel('扫描次数');
ylabel('几何中心偏移量')

%设置误差函数：E=   从f=3开始，取每4个数作为一组，进行误差的加权平均

