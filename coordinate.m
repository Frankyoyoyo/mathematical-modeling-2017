%coordinate transformation
function [C]=coordinate(in,x,y)

%input:
%in==0: from pixel coordinate to physical coordinate
%in==1: reverse
    theta=0.5231;

    if in==0
        C = [cos(theta),sin(theta);-sin(theta),cos(theta)] * [x-200;y-218] .* 0.2768;
        C = [C(1);-C(2)] + 50;
    else
        C = ([cos(theta),sin(theta);-sin(theta),cos(theta)] * [x-50;y-50])./0.2768 + [200;-218];
        C = [C(1);-C(2)];
    end
end