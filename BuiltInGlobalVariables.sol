//SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract variables{

    address public owner;
    uint public sentValue;

    constructor(){
        owner = msg.sender;
    }
   
    // if u want to change the owner
    function changeOwner(address _owner) public {
        owner = _owner;
    }

    // Send Ethers
    function sendEther() payable public {
        sentValue = msg.value;
    }
 
    // Get The Current contract's balance
    function getEtherValue() public view returns (uint) {
        return address(this).balance;
    }
}