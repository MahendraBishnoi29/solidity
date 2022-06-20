//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Deposit{

    // Add a function so that the contract can receive ETH by sending it directly to the contract address.
    // Return the contract’s balance.

    receive() external payable{}
    fallback() external payable{}

    function sendEther() public payable{
      uint x;
      x++;
    }

    function receiveEth() public view returns(uint) {
        return address(this).balance;
    }

    function sendEth(address payable recepient, uint amount) public payable{
       recepient.transfer(amount);
    }
}