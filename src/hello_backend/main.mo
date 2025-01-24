import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Array "mo:base/Array";

// A Decentralised Banking
actor DBank {

    stable var currentValue: Float = 100;
    stable var startTime = Time.now();
    Debug.print(debug_show(startTime));

    // Define an enum for loan request status
    type LoanStatus = { #Pending; #Approved; #Rejected; };

    // Define a struct to represent a loan request
    public type LoanRequest = {
        amount: Float;
        duration: Int; 
        timestamp: U64; // Timestamp of the request
        status: LoanStatus; // Status of the request
    };

    // Stable storage to hold loan requests
    stable var loanRequests: [LoanRequest] = []; 

    // Function to request a loan
    public func loanRequest(amount: Float, duration: Int) {
        assert(amount > 0.0 "Invalid loan amount: Amount must be greater than zero."); 
        assert(duration > 0 "Invalid loan duration: Duration must be greater than zero."); 

        let newRequest: LoanRequest = {
            amount: amount,
            duration: duration,
            timestamp: Time.now(),
            status: LoanStatus.#Pending, 
        };

        loanRequests := Array.append(loanRequests, [newRequest]);
        Debug.print("Loan request submitted: Amount: " # debug_show(amount) # 
                    " Duration: " # debug_show(duration)); 
    }

    // Function to top up currentValue
    public func topUp(amount: Float) {
        currentValue += amount;
        Debug.print("New balance after top-up: " # debug_show(currentValue));
    }

    // Function to withdraw an amount from currentValue
    public func withdraw(amount: Float) {
        let tempValue: Float = currentValue - amount;
        if (tempValue >= 0) {
            currentValue -= amount;
            Debug.print("New balance after withdraw: " # debug_show(currentValue));
        } else {
            Debug.print("Amount too large to withdraw, currentValue less than 0.");
        }
    }

    // Function to check balance
    public query func checkBalance() : async Float {
        return currentValue;
    }

    // Compound Interest
    public func compound() {
        let currentTime = Time.now();
        let timeElapsedNS = currentTime - startTime;
        let timeElapsedS = timeElapsedNS / 1000000000;
        currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
        startTime := currentTime; // set startTime to previous time compound
    }

    // Function to send money
    public func sendFund(amount: Float, receiverNumber: Int) : async Text {
        let sendValue: Float = currentValue - amount;
        Debug.print("Amount to send: " # debug_show(amount));
        Debug.print("Receiver Number: " # debug_show(receiverNumber));
        if (sendValue < 50) {
            Debug.print("Insufficient currentBalance!");
            return "Send failed. Insufficient balance."
        } else {
            currentValue -= amount;
            Debug.print(debug_show(currentValue));
            return "Funds sent successfully. New balance: " # debug_show(currentValue);
        }
    }

    // Function to get Transaction History
    stable var recordHistory: [Text] = [];
    public func transactionHistory(description: Text) : async Text {
        recordHistory := Array.append(recordHistory, [description]);
        return "Transaction recorded successfully.";
    }

    public query func getTransactionHistory() : async [Text] {
        return recordHistory;
    }
};










































// import Debug "mo:base/Debug";
// import Nat "mo:base/Nat";



// actor Project{
  
//  var greeting = "Hello World!";
//  let number : Nat = 5;
//  Debug.print(greeting);
//  Debug.print(debug_show(number));


//  type StudentDetails = {
//    id : Nat;
//    name : Text;
//    course : Text;
//  };


//  var student1 : StudentDetails = {
//    id = 123456;
//    name = "Chemist";
//    course = "CS2";
//  };


//  Debug.print(Nat.toText(student1.id) # student1.name # student1.course);
//  // Type.toType(xx)


//  // Functions
//  func addnum(x : Nat, y : Nat): Nat{
//    return (x + y);
//  };


//  public func addTwoNumbers(x : Nat, y : Nat): async Nat {
//    addnum(x, y);
//  };

// // Decentralised Banking System
//  // checkBalance , withDraw, topUp, transactions
//  stable var balance : Float = 100;
//  stable var transactions : [Transaction] = [];
//  stable var transactionId : Nat = 0;
//   type Transaction ={
//    id : Nat;
//    message : Text;
//    timeStamp: Time.Time;
//  };

//  func recordTransactions(message : Text){
//    var transaction : Transaction = {
//      id = transactionId;
//      message = message;
//      timeStamp = Time.now();
//    };
//      transactions := Array.append(transactions, [transaction]);
//      transactionId +=1;
//  };


//  public func checkBalance(): async Text{
//    var message = "Your balance is " # Float.toText(balance);
//    recordTransactions(message);
//    return message;
//  };


//  public func topUp(amount: Float): async Text{
//    balance := balance + amount;
//    var message = "You deposited: " # Float.toText(amount);
//    recordTransactions(message);
//    return message;
//  };


//  public func withrawBalance(amount: Float): async Text{
//    if (amount > balance){
//      return "You are a broke boy ";
//    };
  
//    balance := balance - amount;
//    var message = "You withdrew: " # Float.toText(amount);
//    recordTransactions(message);
//    return message;
//  };


//  public func getTransactions(): async [Transaction]{
//    return transactions;
//  };


// }




 