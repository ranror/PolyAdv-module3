pragma circom 2.0.0;

/* This circuit template checks that c is the multiplication of a and b. */

template Multiplier2 () {

   // Input signals
   signal input a;
   signal input b;

   // Output signals
   signal output Q;

   // Component gates
   component xorGate = XOR();
   component notGate = NOT();
   component andGate = AND();

   // Intermediate signals
   signal intermediate1;
   signal intermediate2;

   // Logic of circuits
   xorGate.a <== a;
   xorGate.b <== b;
   intermediate1 <== xorGate.out;

   notGate.in <== intermediate1;
   intermediate2 <== notGate.out;

   andGate.a <== intermediate1;
   andGate.b <== intermediate2;
   Q <== andGate.out;
}

template XOR(){
   signal input a;
   signal input b;
   signal output out;
   out <== a+b-2*a*b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1-in;
}

template AND(){
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

component main = Multiplier2();
