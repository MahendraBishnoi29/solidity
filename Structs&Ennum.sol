// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

struct Instructor {
    string name;
    uint age;
    address addr;
}

contract Acedamy{
    Instructor public acedamyInstructor;
    //Enum
    enum State {open, close}
    //defining a new acedemyState variable using State ENUM
    State public acedamyState = State.open;

    constructor(string memory _name, uint _age) {
        acedamyInstructor.name = _name;
        acedamyInstructor.age = _age;
        acedamyInstructor.addr = msg.sender;
    }

    function changeIntructor(string memory _name, uint _age, address _addr) public{
        if(acedamyState == State.open){
           Instructor memory changeInstructor = Instructor({
              name: _name,
              age: _age,
              addr: _addr
           });
           
           acedamyInstructor = changeInstructor;
        }
      
    }
}