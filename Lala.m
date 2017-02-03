frameLength = 256; 
miss = dsp.AudioFileReader('Gun.wav', 'SamplesPerFrame', frameLength);
targetright = dsp.AudioFileReader('zombiesound.wav', 'SamplesPerFrame', frameLength);
targetleft = dsp.AudioFileReader('zombiesound.wav', 'SamplesPerFrame', frameLength);
hit = dsp.AudioFileReader('Both.wav', 'SamplesPerFrame', frameLength);
deviceWriter = audioDeviceWriter('SampleRate', miss.SampleRate); 

while(true)

switch midiid

    case 3001 % hit light & button
     %reset(fileReader)

     while ~isDone (hit)
     signal = hit();      
     deviceWriter(signal); 
     end
     
    case 9001 % miss no light but button
   
     while ~isDone (miss)
     signal = miss(); 
     deviceWriter(signal);

     end
     
      case 3003 % target Right
          while ~isDone (targetright)
     rightsignal = targetright();
     mono = 0.5*(rightsignal(:,1) + rightsignal(:,2)); 
     deviceWriter([0*mono mono]); 
          end
          
      case 4004 % Target Left
      while ~isDone (targetleft)
     leftsignal = targetleft();
     mono = 0.5*(leftsignal(:,1) + leftsignal(:,2)); 
     deviceWriter([mono 0*mono]);
      end
    
end
release(deviceWriter); 
release(miss);
release(hit);
release(targetleft);
release(targetright);
end 







    

