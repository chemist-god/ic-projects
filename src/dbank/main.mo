import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {

    var currentValue = 100;

    public func topUp(amount: Nat) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };
};
 
 //you realised anytime we run this func , the amount input always add up back 
 //to the initial value set that 100, but it does not increase from 
 //where you it was called previously, this concept is called
 //Orthogonal Persistence -will talk about it more later on