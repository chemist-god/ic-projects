import Debug "mo:base/Debug";

//A Decentralised Banking
actor DBank {
  var currentValue = 300;
  currentValue := 100;

  // let id = 1234567890;
  // Debug.print(debug_show(id));

  //here will defined the functionalities that users will perform
  //*1: topUp function and it is a private function
  public func topUp() {
    //this function is a private inside the actor, so when it is called outside we get an
    //error: cannot find canister id
    //so to be able to call it outside we include the key "public" infront of the func

    currentValue += 1;
    Debug.print(debug_show (currentValue));
  };
  // topUp();

};
