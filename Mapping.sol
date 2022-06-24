// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Mappings{
    // mapping (address => uint) public bids;

    // function checkBids() payable public {
    //     bids[msg.sender] = msg.value;   
    // }

   //Another mapping Example ✅


   mapping(uint => Book) public books;

   struct Book {
      string id;
      string author;
   }

    // function for changing the booka and adding the author
    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
    }

     // delete book
    // function deleteBook(uint i) public {
    //     delete books[i];
    // }

    
  
}