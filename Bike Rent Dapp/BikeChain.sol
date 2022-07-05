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
         require(renters[walletAddress].Due == 0, "You Have a pending balance!");
         require(renters[walletAddress].canRent == true, "You cannot Rent at This Time.");
         renters[walletAddress].Active = true; 
         renters[walletAddress].Start = block.timestamp; // This Will Return the exact time when the Renter Checked Out in Unix Timestamp
         renters[walletAddress].canRent = false; // Since Renter is active and already checked out so he can't rent a bike now
     }

     // After Check out Renters can now Check in to Rent a Bike
     function checkIn(address walletAddress) public {
         require(renters[walletAddress].Active, "Please Check Out a Bike first.");
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
         require(renters[walletAddress].Active == false, "Bike is Currently Checked out!");
        //  uint time = renterTimespan(renters[walletAddress].Start, renters[walletAddress].End);
        //  uint timeInMinutes = time / 60;
        //  return timeInMinutes;
        return 6;
     }

     //Get the Balance of the Contract
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


     // function for Frontend to specify that we can rent the bike without looking at the Renter Struct
     function canRentBike(address walletAddress) public view returns(bool){
         return renters[walletAddress].canRent;
     }

     // Deposit 
     function deposit(address walletAddress) public payable{
         renters[walletAddress].Balance += msg.value; //here we're dopositing money from the Contract but Crediting that money in the Renter's Account
     }

     //Make Due Payment
     function makePayment(address walletAddress) public payable {
         require(renters[walletAddress].Due > 0, "You do not have anything Due at this time.");
         require(renters[walletAddress].Balance > msg.value, "You do not have enough Funds to cover Payment. Please make a Deposit first!.");
         renters[walletAddress].Balance -= msg.value; // after paying the due amount money will be deducted from the Renter's Account
         renters[walletAddress].canRent = true;
         renters[walletAddress].Due = 0;
         renters[walletAddress].Start = 0;
         renters[walletAddress].End = 0;
     }

     //Get Due Payment
     function getDue(address walletAddress) public view returns(uint){
         return renters[walletAddress].Due;
     }

     //Get Information about renter
     function getRenter(address walletAddress) public view returns(string memory firstName, string memory lastName, bool canRent, bool Active ) {
         firstName = renters[walletAddress].firstName;
         lastName = renters[walletAddress].lastName;
         canRent = renters[walletAddress].canRent;
         Active = renters[walletAddress].Active;

     }

}