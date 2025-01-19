import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";

    //A Decentralised Banking 
actor DBank {

    var currentValue = 100; //initialized currentValue


//Here are some functionalities that users will perform like topUp balance, withdraw amount, checkBalance;
        //*Function to topUP currentValue
    public func topUp(amount: Nat) {  //this is a stable variable, because after toping up and you refresh the page, it get back to the initial value set. 
        currentValue += amount;
        Debug.print(debug_show (currentValue));
    };

    //Function to withdraw() an amount from currentValue
    public func withdraw(amount: Nat) {
        let tempValue: Int   = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
        Debug.print(debug_show(currentValue));
        } else {
            Debug.print("Amount too large to withdraw, currentValue less than 0.")
        }
    };

    //Function to check balance
    public query func checkBalance(): async Nat {
        return currentValue;
    };
};
 
        