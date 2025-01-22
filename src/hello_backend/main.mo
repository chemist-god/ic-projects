import Debug "mo:base/Debug";
import Nat "mo:base/Nat";



actor Project{
 var greeting = "Hello World!";
 let number : Nat = 5;
 Debug.print(greeting);
 Debug.print(debug_show(number));


 type StudentDetails = {
   id : Nat;
   name : Text;
   course : Text;
 };


 var student1 : StudentDetails = {
   id = 123456;
   name = "Chemist";
   course = "CS2";
 };


 Debug.print(Nat.toText(student1.id) # student1.name # student1.course);
 // Type.toType(xx)


 // Functions
 func addnum(x : Nat, y : Nat): Nat{
   return (x + y);
 };


 public func addTwoNumbers(x : Nat, y : Nat): async Nat {
   addnum(x, y);
 };


}