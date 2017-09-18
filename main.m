load data;
Img = filtTheProj(AS4);
Imgg = reebuild(Img,0);
[x,y] = meshgrid(1:362,1:362);
mesh(x,y,Imgg);
figure(2);
imshow(Imgg,[])

O1=coordinate(1,0,0);
s=-100:362;
t1=tan(0.5231)*(s-O1(1))+O1(2);
t2=tan(pi/2+0.5231)*(s-O1(1))+O1(2);

figure(2)
hold on
plot(s,t1,s,t2)
axis([-100,500,-100,500])
xlabel('x')
ylabel('y')
text(-60,290,'O','horiz','center')
text(290,450,'x(mm)','horiz','center')
text(180,-76,'y(mm)','horiz','center')              %physical coordinate

% syms x y
% [x,y]=solve('(x+46.7201)^2+(y-284.2404)^2=(1/0.2768*10)^2','y=tan(0.5231)*(x+46.7201)+284.2404')
plot(-15.4240,302.2883,'*b')
text(-28,310,'10mm','horiz','center')               %unit length

s=321:500;
t(1,180)=0;
t=t+410;
plot(s,t);
text(400,390,'50 mm','horiz','center')
text(400,430,'181 points','horiz','center')         %scale