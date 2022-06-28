//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BikeChain {
    address owner;
    //Add Yourself as a Renter
    constructor() {
        owner = msg.sender;
    }

    //we need our own data type with some types or properties for Each Renter
    struct Renter {
        address payable walletAddress;
        string firstName;
        string lastName;
        bool canRent;
        bool Active;
        uint Balance;
        uint Due;
        uint Start;
        uint End;
    }
     
     // Now we want to store our all Renters in Somerwhere based on their walletAddress Addresses
     mapping (address => Renter) public renters;

     function addRenter(  address payable walletAddress, string memory firstName, string memory lastName, bool canRent, bool Active, uint Balance, uint Due, uint Start, uint End) public {
         // Create a New Renter Using Their Wallet Addresses
        renters[walletAddress] = Renter(walletAddress, firstName, lastName, canRent, Active, Balance, Due, Start, End);
     }


}