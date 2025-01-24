import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Array "mo:base/Array";

//A Decentralised Banking
actor DBank {

     stable var currentValue : Float = 100;

    stable var startTime = Time.now();
    Debug.print(debug_show (startTime));

    

    //Here are some functionalities that users will perform like topUp balance, withdraw amount, checkBalance, sendFunds;
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

    //Function to send money
    public func sendFund(amount : Float, receiverNumber : Int) : async Text {
        let sendValue : Float = currentValue - amount;
        Debug.print("Amount to send: " # debug_show (amount));
        Debug.print("Receiver Number: " # debug_show (receiverNumber));
        if (sendValue < 50) {
            Debug.print("Insufficient currentBalance!");
            return "Send failed. Insufficient balance."
        } else {
            currentValue -= amount;
            Debug.print(debug_show (currentValue));
            return "Funds sent succesfully. New balance: " # debug_show(currentValue);
        }
    };

    //Function to get Teransaction History
     stable var recordHistory : [Text] = [] ;
    public func transactionHistory(description : Text) {
        recordHistory := Array.append(recordHistory, [description]);
    };

    public query func getTransactionHistory () : async [Text] {
        return recordHistory;
    };

    //
    
};
