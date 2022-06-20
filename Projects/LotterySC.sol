//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public Players;

    address public Manager;

    //contructor to make sure that no body can change the Manager
    constructor() {
        Manager = msg.sender;
    }

    receive() external payable {
      //players have to put minimum 0.1Eth to lottery to be added in game
      require(msg.value == 0.1 ether);
      Players.push(payable(msg.sender));
    }

    // function for getting the lottery balance 
    function getBalance() public view returns(uint) {
        //you can only see the balance if ur Manager
        require(msg.sender == Manager);
        return address(this).balance;
    }
}