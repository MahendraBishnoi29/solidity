// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Enum{
    //Define a Enum 
    enum  States{applied, pending, accepted}

    // Declare a variable of the type Status(enum)
    // This can only contain one of the predefined values
    States public state;

    // Pass a uint for input to update the value
    function setState(States _state) public {
        state = _state;
    }

    // Update value to a specific enum members
    function changeState() public {
        state = States.pending;
    }


}