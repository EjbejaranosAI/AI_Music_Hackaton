s.boot

(
SynthDef(\miprimersinte,{|freq=60, amp=2, gate=1|
	var sig, env;
	sig=SinOsc.ar(freq.midicps,0,amp)!2;
	env=EnvGen.kr(Env.perc(0,1),gate,doneAction:2);
	Out.ar(0,sig*env)
}).add
)
Synth(\miprimersinte)
s.meter
(
SynthDef(\segundosinte,{|freq=64, amp=2, gate=1|
	var sig, env;
	sig=SinOsc.ar(freq.midicps,0,amp)!2;
	env=EnvGen.kr(Env.perc(0,1),gate,doneAction:2);
	Out.ar(0,sig*env)
}).send(s)
)
Synth(\segundosinte)

(
~martinillo = Pfsm([
	#[0], /* estado de entrada puedo elegir un estado o
	elegir entre un arreglo [0,1,2, . . ,n] */

	// Sol estado 0
	Pbind( \instrument, \miprimersinte, \dur, Pseq([1,1,1,1,1,1,1,1,1,1,2,1,1,2])
		/*duración*/, \freq, Pseq([67,69,71,67,67,69,71,67,71,72,74,71,72,74]));
	Pbind(\instrument, \segundosinte, \dur,
		Prand([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2],12), \freq,
		Prand([67,69,71,67,67,69,71,67,71,72,74,71,72,74],12))
	, #[1], /*transiciones posibles*/

	// La estado 1
	Pbind(\instrument, \segundosinte, \dur,
		Prand([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2],12), \freq,
		Prand([67,69,71,67,67,69,71,67,71,72,74,71,72,74],12)), #[2],
	// Si estado 2
	Pbind( \instrument, \miprimersinte, \dur, Pseq([1,1,1,1,1,1,1,1,1,1,2,1,1,2])

		/*duración*/, \freq, Pseq([67,69,71,67,67,69,71,67,71,72,74,71,72,74])), #[5],
	/*transiciones posibles*/
	// do estado 3
	Pbind( \dur, 1, \midinote, Pseq([72])), #[4],
	// Re estado 4
	Pbind( \dur, 1, \midinote, Pseq([74])), #[0,0,5],
	nil, nil /*estado final estado 5 */
]);
)
(
~martinillo1 = Pfsm([
	#[0], /* estado de entrada puedo elegir un estado o
	elegir entre un arreglo [0,1,2, . . ,n] */

	// Sol estado 0
	Pbind( \instrument, \miprimersinte, \dur, Pseq([1,1,1,1,1,1,1,1,1,1,2,1,1,2])
		/*duración*/, \freq, Pseq([67,69,71,67,67,69,71,67,71,72,74,71,72,74]));
	Pbind(\instrument, \segundosinte, \dur,
		Prand([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2],12), \freq,
		Prand([67,69,71,67,67,69,71,67,71,72,74,71,72,74],12))
	, #[1], /*transiciones posibles*/

	// La estado 1
	Pbind(\instrument, \segundosinte, \dur,
		Prand([0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2],12), \freq,
		Prand([67,69,71,67,67,69,71,67,71,72,74,71,72,74],12)), #[2],
	// Si estado 2
	Pbind( \instrument, \miprimersinte, \dur, Pseq([1,1,1,1,1,1,1,1,1,1,2,1,1,2])
		/*duración*/, \freq, Pseq([67,69,71,67,67,69,71,67,71,72,74,71,72,74])), #[5],
	/*transiciones posibles*/
	// do estado 3
	Pbind( \dur, 1, \midinote, Pseq([72])), #[4],
	// Re estado 4
	Pbind( \dur, 1, \midinote, Pseq([74])), #[0,0,5],

	nil, nil /*estado final estado 5 */
]);
)
~martinillo1.play;
~martinillo.play