// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;


contract basic {
    //We Don't need to create a getter function if we create a PUBLIC state Variable
    string public name = "Browny";
    uint age = 20;

    function setter(string memory _name, uint _age) public {
        name = _name;
        age = _age;
    }

    //if we haven't create a PUBLIC state variable then we need to create a Getter function for getting data
    function getter() public view returns (string memory){
        return name;
    }
    
    
}