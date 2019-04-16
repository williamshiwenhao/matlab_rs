%*************************************************************************
%   Created     :   2010-6-3
%   Author      :   Shiqin Song(shiqinsac@gmail.com)
%   File Name   :   Parameter.m
%   Abstract    :   Parameter defination.
%    
%   Version     :   1.0
%**************************************************************************
function Parameter

global GF24 Rs Test

GF24.decimal = [1;2;4;8;3;6;12;11;5;10;7;14;15;13;9];
GF24.min = 0;
GF24.max = 15;

Rs.generator = [7 8 12 13 1];
Rs.n = 15;
Rs.k = 11;
Rs.t = (Rs.n-Rs.k)/2;
Rs.RegLen = 2*Rs.t;

Test.FrameLen = 200000;
Test.SNR = [0:2:14];