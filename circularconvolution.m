clc;
clear all;
close all;

x = input('Enter input sequence: ');
h = input('Enter impulse response: ');

M = length(x);
N = length(h);

% Determine the length of circular convolution (L should be max(M, N))
L = max(M, N);

% Zero-padding to make both sequences of equal length L
x = [x zeros(1, L - M)];
h = [h zeros(1, L - N)];

y = zeros(1, L); % Initialize output sequence

% Circular convolution using time-domain approach
for i = 1:L
    hm = circshift(h, [0, i-1]); % Circular shift of h
    y(i) = sum(x .* hm); % Element-wise multiplication and summation
end

display('User-defined logic convolution output:');
y

display(' predefined function output:');
cconv(x, h, M)

nx = 0:M-1;
nh = 0:N-1;
ny = 0:L-1;

figure;
subplot(3,1,1);
stem(nx, x, 'filled');
title('Input sequence');
xlabel('Time');
ylabel('Amplitude');

title('Input impulse sequence');
subplot(3,1,2);
stem(nh, h, 'filled');
title('Impulse Response');
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,3);
stem(ny, y, 'filled');
title(' circular Output');
xlabel('Time') ;
ylabel('Amplitude');

