%自己设计的定标模板
clear 
clc

[a,b] = meshgrid(1:362,1:362);
[X,Y] = meshgrid(1:361,1:361);
e = 1:362;
model = zeros(359,359);                                 %制作模板
for i = 1:120
    for j = 80:179
        model(130 - i, j) = 1 / 1.2826;
    end
end
for i = 1:60
    for j = 80:179
        model(129 + i, j) = 1;
    end
end
for i = 129:130
    for j = 80:179
        model(i, j) = 1.5;
    end
end
model1 = imrotate(model, 30, 'nearest');                
model = model1(66:426,66:426);
D = radon(model);                                       %模板的探测数据
D(512,180) = 0;
E = reebuild(D,0);                                        %模板的反投影矩阵
mesh(a,b,E)
[x,y] = find(E == max(max(E)))                          %几何中心横纵坐标
disp('the real center is X=163 Y=112')
figure(2)
mesh(X,Y,model)
F = gradient(E);
[x1,y1] = find(F == max(max(F)));                       %梯度最大值点横纵坐标
figure(3)
E = E.';
imshow(E,[])                                            %作出反投影图
hold on
if (x1 -x) * (y1 - y) ==0                               %做出坐标轴
    t1 = y .* e ./ e;
    plot(e,t1,'r')
    t2 = x .* e ./ e;
    plot(t2,e,'r')
else
    t1 = (y1 - y) / (x1 - x) .* (e - x) + y;
    plot(e,t1,'r')
    t2 = -(x1 - x) / (y1 - y) .* (e - x) + y;
    plot(e,t2,'r')
end
hold off
Period = 20 / min(sum(D ~= 0))                        %探测器间距
if x1 == x                                            %探测器初始角度
    if y > y1
        theta = 0.0000
    else 
        theta = 180.0000
    end
elseif y1 == y
    if x > x1
        theta = 90.0000
    else
        theta = -90.0000
    end
else 
    theta = atan((y1 - y) / (x1 - x)) / pi * 180
end