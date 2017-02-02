filename = 'gunshot.wav'


[y,Fs] = audioread('gunshot.wav')

while(true)
    
    switch midiid
    case 1
    sound(y,Fs)
    end
    

        

end


        