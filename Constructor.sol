// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Bank{
    uint public balance;
    string public holder;
    address public Id;
  
  // Constructor Function is only Called Once When The Contract Is Deployed
    constructor(uint _balance , string memory _holder){
        balance = _balance;
        holder = _holder;
      //msg.sender is Inbuilt variable that always exist by default and we can use it.
        Id = msg.sender;
    }

   //function for set Account balance
    function setBalance(uint _balance) public {
            balance = _balance;
    }
 
   //function for set holder's Name
    function setHolder(string memory _holder) public {
        holder = _holder;
    }
}