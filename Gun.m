

sampleRate = 256
miss = dsp.AudioFileReader('gunshot.wav','SamplesPerFrame',sampleRate); 
deviceWriter = audioDeviceWriter('SampleRate', miss.SampleRate); 

while(true)
    signal = miss(); 
    deviceWriter(signal);
end
