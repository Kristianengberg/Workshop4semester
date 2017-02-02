

classdef gunScript < audioPlugin
    
    properties
       filename = 'gunshot.wav'
        h = midicontrols
        
    end
end

[y,Fs] = audioread('gunshot.wav')
while(true)
    midiread(h)
    switch h
    case 1
    sound(y,Fs)
    end
    

        

end



        