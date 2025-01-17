import Debug "mo:base/Debug";

actor DBank {

    var currentValue = 100;

    public func topUp() {
        currentValue += 1;
        Debug.print(debug_show (currentValue));
    };
};
