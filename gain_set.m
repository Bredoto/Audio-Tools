function [ Y ] = gain_set( Y , FS , gain , g_mode , varargin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

p = inputParser ;

p.addOptional('time_range', [-1 0] ) ;

p.parse( varargin{:} );

time_range = p.Results.time_range ;

if strcmpi(g_mode,'lin')
    g = gain ;
elseif strcmpi(g_mode,'dB')
    g = 10^(gain/20) ;
else
    error('error: invalid gain mode; admitted values are "lin" or "dB" ') ;
end

t = 1/FS ;

[ start_sample end_sample ] = test_time_range( time_range , t , size(Y) ) ;

r = start_sample:end_sample ;
Y(r,:) = Y(r,:) * g ;

end

