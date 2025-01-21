import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";
// import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

//A Decentralised Banking
actor DBank {

     stable var currentValue : Float = 100;

    stable var startTime = Time.now();
    Debug.print(debug_show (startTime));

    //Here are some functionalities that users will perform like topUp balance, withdraw amount, checkBalance;
    //*Function to topUP currentValue
    public func topUp(amount : Float) {
        currentValue += amount;
        Debug.print("New balance after top-up: " # debug_show (currentValue));
    };

    //Function to withdraw() an amount from currentValue
    public func withdraw(amount : Float) {
        let tempValue : Float = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print("New balance after withdraw: " # debug_show (currentValue));
        } else {
            Debug.print("Amount too large to withdraw, currentValue less than 0.");
        };
    };

    //Function to check balance
    public query func checkBalance() : async Float {
        return currentValue;
    };

    //Compund Interest
    public func compound() {
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime; //set startTime to prvious time compond
    };
};
