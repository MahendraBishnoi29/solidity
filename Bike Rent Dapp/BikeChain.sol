//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract BikeChain {
    address owner;
    //Add Yourself as a Renter or Owner of Contract
    constructor() {
        owner = msg.sender;
    }

    // We need our own data type with some types or properties for Each Renter
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

     // Create new Renter
     function addRenter(  address payable walletAddress, string memory firstName, string memory lastName, bool canRent, bool Active, uint Balance, uint Due, uint Start, uint End) public {
         // Create a New Renter Using Their Wallet Addresses
        renters[walletAddress] = Renter(walletAddress, firstName, lastName, canRent, Active, Balance, Due, Start, End);
     }

     // Check Out the Bike
     function checkOut (address walletAddress) public {
         renters[walletAddress].Active = true;
         renters[walletAddress].Start = block.timestamp; // This Will Return the exact time when the Renter Checked Out in Unix Timestamp
         renters[walletAddress].canRent = false;
     }

     // After Check out Renters can now Check in to Rent a Bike
     function checkIn(address walletAddress) public {
         renters[walletAddress].Active = false;
         renters[walletAddress].End = block.timestamp; // give us the time when Renter had checked In
         setDueAmount(walletAddress);
     }

     // subtracting the Renter's check out & check in Time for getting the all over Duration
     function renterTimespan(uint start, uint end) internal pure returns(uint) {
         return end - start;
     }
 
     // Get the total amount in Minutes Of Renter
     function getTotalDuration(address walletAddress) public view returns(uint) {
         uint time = renterTimespan(renters[walletAddress].Start, renters[walletAddress].End);
         uint timeInMinutes = time / 60;
         return timeInMinutes;
     }

     //Get the Balance of the Address
     function BalanceOf() public view returns(uint) {
         return address(this).balance;
     }

     // Get the Balance of Renter
     function balanceOfRenter(address walletAddress) public view returns(uint){
         return renters[walletAddress].Balance;
     }

     // Set The Due Amount
     function setDueAmount(address walletAddress) internal {
         uint timeSpanMinutes = getTotalDuration(walletAddress);
         uint fiveMinutesIncreament = timeSpanMinutes / 5;
         renters[walletAddress].Due = fiveMinutesIncreament * 5000000000000000;
         
     }

     function canRentBike(address walletAddress) public view returns(bool){
         return renters[walletAddress].canRent;
     }

}