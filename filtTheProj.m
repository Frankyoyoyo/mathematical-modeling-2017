function Q = filtTheProj(p)
%建立filter
    n = 0:512;
    h = zeros(1,513);
    h(1) = 1/4;
    h(2:2:end) = -1./((pi*n(2:2:end)).^2);
    h = [h, h(end-1:-1:2)];
    H = 2 * abs(fft(h));
    omega = 2*pi*(0:1023)/1024;
    windows = (0.54 + 0.46 * cos(omega(2:end)/1));
    H(2:end) = H(2:end) .* windows;

    p(length(H),1)=0;
    S = fft(p);
    tmp = bsxfun(@times, S, H');
    Q = ifft(tmp,'symmetric');
    Q(513:end,:) = [];
end