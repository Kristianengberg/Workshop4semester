frameLength = 256; 
miss = dsp.AudioFileReader('gunshot.wav', 'SamplesPerFrame', frameLength);
hit = dsp.AudioFileReader('gunshot.wav', 'SamplesPerFrame', frameLength);
deviceWriter = audioDeviceWriter('SampleRate', miss.SampleRate);

while(true)

switch midiid

    case 3001 % hit light & button
     %reset(fileReader)

     while ~isDone (hit)
     signal = hit(); 
     shot = miss(); 
     deviceWriter(signal);
     deviceWriter(shot); 
     end
     
    case 9001 % miss no light but button
    % reset(fileReader)

     while ~isDone (miss)
     signal = miss(); 
     deviceWriter(signal);
     
     end
end
release(deviceWriter); 
release(miss);
end




    

