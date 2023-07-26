pragma circom 2.0.0; 


template YashCircuit () { 
    //signal inputs
    signal input A;
    signal input B;

    //signals from gates
    signal X;
    signal Y;

    //final signal output
    signal output Q;

    //component gates used to create custom circuit
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    //circuit logic
    andGate.A <== A;
    andGate.B <== B;
    X<== andGate.out;

    notGate.in <==B;
    Y <== notGate.out;

    orGate.X <== X;
    orGate.Y <== Y;
    Q <== orGate,out


   
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = YashCircuit();