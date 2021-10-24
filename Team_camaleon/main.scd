s.boot

s.waitForBoot({

	SynthDef('closedhat', {

		var hatosc, hatenv, hatnoise, hatoutput;

		hatnoise = {LPF.ar(WhiteNoise.ar(0.3),6000)};

		hatosc = {HPF.ar(hatnoise,3000)};
		hatenv = {Line.ar(1, 0, 0.03)};

		hatoutput = (hatosc * hatenv);

		Out.ar(0,
			Pan2.ar(hatoutput, 0)
		)

	}).add;

	(
		SynthDef(\help_sinegrain,
			{ arg out=0, freq=60, sustain=0.5;
				var env;
				env = EnvGen.kr(Env.perc(0.01, sustain, 0.5), doneAction: Done.freeSelf);
				Out.ar(out, SinOsc.ar(freq.midicps, 0, env * 2))
		}).add;
	);


	// Load the CSV.
	~csvIn = {
		arg filename;
		var rows;
		rows = CSVFileReader.read(filename);
	};




for (0, 20, { arg i;x = ~csvIn.("/home/ejbejaranos/Desktop/AI_Music_Hack/camaleon/dataTrain/episode_"+i).postln; i.postln }); // prints values 0 through 20


var cont =-1;
	for(0,20,{arg i;
		~weight = [x[i+1][0],x[i+2][0],x[i+3][0],x[i+3][0]];
		i.postln;

	})
	//Read notes

	//Read weight

	~weight = [x[0][1],x[0][2],x[0][3],x[0][4]];

	~notas1 =    [x[1][2],x[1][3],x[1][4],x[1][5]];
	(
		Tdef(\toca1,{
			var cont = -1;
			100.do{
				var dice = rrand(0,10)/10;
				cont = cont + 1;
				//o = Synth('openhat');
				c = Synth('closedhat');
				if(dice <= ~weight[cont%~weight.size]){	Synth(\help_sinegrain).set(\freq,~notas1[cont%~notas1.size])
				};
				0.25.wait;
			}
		}).play
	)
})




