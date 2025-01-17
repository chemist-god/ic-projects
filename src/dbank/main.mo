import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

    //A Decentralised Banking 
actor DBank {

    var currentValue = 100; //initialized currentValue


//Here are some functionalities that users will perform like topUp balance, withdraw amount, 
        //*Function to topUP currentValue
    public func topUp(amount: Nat) {
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    //Function to withdraw() an amount from currentValue
    public func withdraw(amount: Nat) {
        currentValue -= amount;
        let tempValue: Int   = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
        Debug.print(debug_show(currentValue));
        }
    }
};
 
        