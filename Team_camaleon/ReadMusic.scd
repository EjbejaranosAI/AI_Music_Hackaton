
s.boot;

s.meter;
s.plotTree;

s.reboot;

s.quit;

//Audio File
~sound = Buffer.read(s,"/home/ejbejaranos/Desktop/AI_Music_Hack/GarotadeIpanema.wav");
~sound.play;

~sound.duration;


//with ENvelope UGen

(
SynthDef.new(\playEnv,{
	arg atk=0.01, rel=1,c1=1, c2=(-1), amp=0.5,
	buf=0,rate=1,spos=0,pan=0,out=0;
	var env,sig;
	env = Env([0, 1, 0],[atk,rel],[c1,c2]).kr(2);
	sig = PlayBuf.ar(2, buf,rate, startPos: spos);
	sig = sig*env;
	sig = Pan2.ar(sig, pan, amp);
	Out.ar(out,sig);
}).add;
)

x = Synth.new(\playEnv);

//

(
SynthDef.new(\play,{
	arg amp=0.7,buf=0,rate=1,spos=0,pan=0,out=0;
	var sig;
	sig = PlayBuf.ar(2, buf,rate, startPos:spos);
	sig = sig;
	sig = Pan2.ar(sig,pan,amp);
	Out.ar(out,sig);
}).add
)

q = Synth.new(\play);
q.free;
