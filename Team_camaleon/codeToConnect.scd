OSCdef(/test,{|msg,time,addr,recvPort|\})

OSCdef(\test, {|msg, time, addr, recvPort| \unmatching.postln}, '/chat', n); // def style

\\\\OSCFunc.trace(true)