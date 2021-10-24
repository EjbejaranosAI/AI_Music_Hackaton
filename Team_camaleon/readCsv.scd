




var midi, dur, test;

// Load the CSV.
~csvIn = {
	arg filename;
	var rows;
	rows = CSVFileReader.read(filename);
};

x = ~csvIn.("/home/ejbejaranos/Desktop/AI_Music_Hack/data.csv").postln

//Read notes

//Read weight
´
// Turn it into a stream? Maybe that's what's happening here?
test = Pseq(x, 2).asStream;

midi = test;
SynthDef(\smooth, { |out, freq = 60, sustain = 1, amp = 0.25|
    var sig;
    sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.linen(0.05, sustain, 0.1), doneAction: Done.freeSelf);
    Out.ar(out, sig ! 2)
}).add;

r = Task({
    var delta;
	var tone;
    while {
		tone = midi.next;
		tone.notNil;
    } {
        Synth(\smooth, [freq: midi.next, sustain: delta]);
		midi.next.postln;
    }
}).play(quant: TempoClock.default.beats + 1.0);





~weight = [x[0][1],x[0][2],x[0][3],x[0][4]];

~notas1 =    [x[1][2],x[1][3],x[1][4],x[1][5]];
(
Tdef(\toca1,{
	var cont = -1;
	100.do{
		var dice = rrand(0,10)/10;
		cont = cont + 1;
		if(dice <= ~weight[cont%~weight.size]){	Synth(\help_sinegrain).set(\freq,~notas1[cont%~notas1.size])
		};
		0.25.wait;
	}
}).play
)





