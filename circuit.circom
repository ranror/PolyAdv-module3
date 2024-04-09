pragma circom 2.0.0;

template Multiplier2 () {
   component andGate = AND();
   component notGate = NOT();
   component orGate = OR();



   signal input A;
   signal input B;
   signal output Q;



   andGate.A <== A;
   andGate.B <== B;

   notGate.in <== B;

   orGate.A <== andGate.out;
   orGate.B <== notGate.out;
   Q <== orGate.out;

}

template OR(){
   signal input a;
   signal input b;
   signal output out;
   out <== a+b-a*b;
}

template NOT(){
   signal input in;
   signal output out;
   out <== 1+in-2*in;
}

template AND(){
   signal input a;
   signal input b;
   signal output out;
   out <== a*b;
}

component main = Multiplier2();
