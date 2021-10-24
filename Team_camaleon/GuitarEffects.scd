(
SynthDef(\brumm, { |dur = 1.6, pan = 6, freq = 60, index = 10|
	var sig = Pan2.ar(
		Blip.ar(freq, index),
		pan
	) * EnvGen.ar(Env.perc(0.1, dur), doneAction: 2);
	Out.ar(0, sig);
}).add;
)

(
Pbind(*[
	dur: Pseq([0.25], inf),
	pan: Pxrand(#[-0.5, 0.5, 0.1, -0.1, 0.8, -1], inf),
	freq: 40,
	instrument: \brumm
]).play();
)

(
Pbind(*[
	dur: Pseq([1.8, 0.2, 0.5, Pseries(0.1, -0.001, 100)], inf),
	pan: Pxrand(#[-0.5, 0.5, 0.1, -0.1, 0.8, -1], inf),
	freq: Pseq([Pseries(140, 0.5, 200)], inf),
	instrument: \brumm
]).play;
)

(
Pbind(*[
	dur: Pseq(Signal.chebyFill(1024, Array.rand(10, 0.0, 10.0)).abs + 0.05, inf),
	pan: Pxrand(#[-0.5, 0.5, 0.1, -0.1, 0.8, -1], inf),
	freq: Pseq(Signal.chebyFill(1024, Array.rand(10, 0.0, 10.0)).abs * 18000 + 120, inf),
	instrument: \(
Pbind(*[
	dur: Pseq([1.2, 0.2, 0.3, Pseries(0.1, -0.002, 50)], inf),
	pan: Pxrand(#[-0.5, 0.5, 0.1, -0.1, 0.8, -1, 1, -0.8], inf),
	freq: Pseq([Pseries(740, 0.5, 200), Pxrand(Array.series(740, 0.5, 200), 50)], inf),
	instrument: \brumm
]).play;
)brumm
]).play;
)


(
Pbind(*[
	dur: Pseq([2.2, 0.01, 0.5, Pseries(0.1, -0.002, 50)], inf),
	pan: Pxrand(#[-0.2, 0.5, 0.1, -0.1, 0.8, -1, 1, -0.8], inf),
	freq: Pseq([Pseries(740, 0.5, 200), Pxrand(Array.series(740, 0.5, 200), 50)], inf),
	instrument: \brumm
]).play;
)