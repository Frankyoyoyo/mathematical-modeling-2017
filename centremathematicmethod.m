%question4: calculating the real center
%rotating centre: affected by all asymmetry points(small circle)
load data
% figure(1)
AS2=reebuild(AS1,0);                                  %unfilted image
Img = filtTheProj(AS1);
AS3 = reebuild(Img,0);                                %*******filted image
% [X Y]=meshgrid(1:362);
% mesh(X,Y,AS2);
% hold on
% [b,a]=find(AS2==max(max(AS2)));
% plot3(a,b,max(max(AS2)),'*b')

%============================standard image(B)============
% figure(2)
% BS1=radon(B);
% BS2=reebuild(BS1,0);
% [X Y]=meshgrid(1:258);
% mesh(X,Y,BS2);
% hold on
% [d,c]=find(BS2==max(max(BS2)));
% plot3(c,d,max(max(BS2)),'*b')
%=====================================================
M=-(1:362)+363;
n=250;
k=tan(pi/2+0.5176);

for h=251:400
    n=n+1;
    
    %先求割线长度
    z=zeros(362);
    for(x=1:362)
        for(y=1:362)
            if(abs(y-1/k*x-h)<1)                       %设置容差
                z(x,y)=2;
            end
        end
    end
    
    
    for(i=1:362)
        for(j=1:362)
            if(AS3(i,j)<10)            %灰度化为01
                C(i,j)=0;
            else C(i,j)=1;
            end
            C(i,j)=C(i,j)+z(i,j);
        end
    end
    
%-----------------完成斜线的作图，不交为2，与图形相交则+1=3

    P=[0,0];Q=[0,0];
    %找到割线，找到起止点(正向搜寻)
    for(j=1:362)        
        for(i=1:362)
            if(C(i,j)==3)
                P=[i,j];
                break
            end
        end
    end

    
    
    for(j=M) %（反向搜寻）       
        for(i=M)
            if(C(i,j)==3)
                Q=[i,j];
                break
            end
        end
    end
    

% imshow(C1)    
    
    length(n)=((P(1)-Q(1))^2+(P(2)-Q(2))^2)^0.5;
    figure(3)
    plot(n,length(n),'or');
    xlabel('截距（像素）');
    ylabel('割线长度（像素）')
    hold on
    drawnow
    
    figure(4)
    imshow(C)
    drawnow
end

%找中点，得到h=567,下一步找几何中心
figure(5)
imshow(AS3,gray);
hold on
x=1:362;
y1=k.*x+567;
y2=-1/k.*(x-200)+218;
plot(x,y1,x,y2);

syms x y
[s,t]=solve('y=(-1.7563)*x+567','y=0.5694*(x-200)+218')

