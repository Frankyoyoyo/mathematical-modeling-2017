%error function
%设置误差函数：E=   从f=3开始，取每4个数作为一组，进行误差的加权平均
changefrequency
for i=1:99
    e(i)=sum(d(2+i:5+i))-4*0.7071;
end
x=2+4.*(1:99);
% plot(x,e,'r');
[fitresult, gof] = errorfunctionfitting(x, e)