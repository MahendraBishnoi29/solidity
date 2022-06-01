// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

struct Business {
    string name;
    uint value;
    address addr;
}

contract Customer {
    // I'm Creating a variable using Struct(Business)
     Business public subBusiness;

    // Now i'm initializing the Struct Variable using Constructor Function
     constructor( string memory _name, uint _value ){
      subBusiness.name = _name;
      subBusiness.value = _value;
      subBusiness.addr = msg.sender;
     }

     //Now I'm Creating a temprory Memory Variable and initializing it with given values and copying it to the storage struct(the state variable of Struct(SubBusineses) )
      function newSubBusiness(string memory _name, uint _value, address _addr) public {
        Business memory tempBusiness = Business({
            name : _name,
            value : _value,
            addr : _addr
        });
      
       // Copying Memory Struct Variable to the Storage one.
        subBusiness = tempBusiness;
      }


}
