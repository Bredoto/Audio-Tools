function [ Y ] = fade_in( Y , FS , fade_time )
%fade_in set a fade in in the sound file Y.

num_fade_samples = floor( fade_time * FS ) + 1 ;
num_samples = length( Y ) ;

ch = min( size( Y ) ) ;

if num_fade_samples > num_samples 
    num_fade_samples = num_samples ; 
end

s=0:(num_fade_samples-1) ;

weight = 0.5 * (1 - cos( pi * s / ( num_fade_samples - 1 ) ) ) ;

for i=1:ch
    Y(1:num_fade_samples,i) = Y(1:num_fade_samples,i) .* weight' ;
end


end

