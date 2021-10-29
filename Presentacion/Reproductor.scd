
s.boot;
(
var agent = -1;
var values;
var countFiles;
var new;
~dict = Dictionary.new; //global variable
3.do{
	agent = agent +1;
	~dict.add(agent -> Array.new(100));
	countFiles = 0;
	99.do{
		values = CSVFileReader.readInterpret("/home/ejbejaranos/Desktop/AI_Music_Hackaton/Presentacion/AIdata/agent"++agent.asString++"/episode"++countFiles.asString++".csv", true, true);
		countFiles = countFiles + 1;
		new = ~dict.at(agent).add(values);
	    ~dict.add(agent -> new);
	};
};
);
//// UNO MAS LINDO!!!
(
SynthDef(\take2,{
  arg out=0.5, freq=60, sustain= 0.75;
    var sig, env;
  sig = Saw.ar([freq.midicps,freq.midicps+2],0.5);
    env = EnvGen.kr(Env.perc(0.001, sustain, 0.5), doneAction: 2);
    Out.ar(out, sig * env )
}).add;
Synth(\take2)
);
(
Tdef(\toc,{
  var agent, episode, note, fplay;
  episode = -1;
  1.do{
    episode = episode + 1;
    note = -1;
    5.do{
      note = note + 1;
      agent = -1;
      3.do{
        agent = agent+1;
		fplay = ~dict.at(agent)[episode+98][0][note];
        Synth(\take2).set(\freq,fplay + 60);
		fplay.postln;
      };
      0.75.wait;
    };
    0.2.wait;
  };
}).play;
);
~totalEpisodes = 20;
(
Tdef(\toc,{
  var agent, episode, note, fplay;
  episode = -1;
  ~totalEpisodes.do{
		("Listening episode "++(episode+1).asString ++ "/" ++ (~totalEpisodes.asString)).postln;
    episode = episode + 1;
    note = -1;
    5.do{
      note = note + 1;
      agent = -1;
      3.do{
        agent = agent+1;
				fplay = ~dict.at(agent)[episode][0][note];
				Synth(\take2).set(\freq,fplay + 60).set(\sustain,0.2);
      };
      0.2.wait;
    };
    0.3.wait;
  };
}).play;
);