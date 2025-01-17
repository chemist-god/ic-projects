import Debug "mo:base/Debug";

//A Decentralised Banking
actor DBank {
  var currentValue = 300;
  currentValue := 100;

  //here will defined the functionalities that users will perform
  //*1: topUp function and it is a private function
  public func topUp() {
    currentValue += 1;
    Debug.print(debug_show (currentValue));
  };
  // topUp();

};
