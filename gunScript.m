filename = 'gunshot.wav'

h = midicontrols
midiread(h)

[y,Fs] = audioread('gunshot.wav')

while(true)
    
    switch h
    case 1
    sound(y,Fs)
    end
    

        

end


        