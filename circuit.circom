pragma circom 2.0.0;

// Gate templates
template OR(){
   signal input a, b;
   signal output out;
   out <== a + b - a * b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1 - in;
}

template AND(){
   signal input a, b;
   signal output out;
   out <== a * b;
}

// Circuit template
template Multiplier2 () {
   // Input signals
   signal input a, b;

   // Internal signals
   signal X, Y;

   // Output signal
   signal output Q;

   // Component gates
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();

   // Connect input signals to gates
   andGate.a <== a;
   andGate.b <== b;
   notGate.in <== b;

   // Connect internal signals to gates
   X <== andGate.out;
   Y <== notGate.out;

   // Connect gates to calculate output
   orGate.a <== X;
   orGate.b <== Y;
   Q <== orGate.out;
}

// Main component
component main = Multiplier2();
