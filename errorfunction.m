%error function
%����������E=   ��f=3��ʼ��ȡÿ4������Ϊһ�飬�������ļ�Ȩƽ��
changefrequency
for i=1:99
    e(i)=sum(d(2+i:5+i))-4*0.7071;
end
x=2+4.*(1:99);
% plot(x,e,'r');
[fitresult, gof] = errorfunctionfitting(x, e)