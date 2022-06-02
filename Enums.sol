// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Enum{
    //Define a Enum 
    enum Winner {yes, no, notSure}
      
    // Define a Variable Using Winner Enum 
    Winner public person = Winner.no;
    uint public amount = 100;

    function checkWinner() public{
        if(person == Winner.yes){
            amount = 0;
        }
    }

    function changeWinner() public{
        person = Winner.notSure;
    }
}