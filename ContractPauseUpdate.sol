pragma solidity ^0.5.0;   

// Creating a contract
contract StartUpdateStop {
    address owner;

    bool public paused;

    constructor() public {
        owner = msg.sender;
    }

    function setPaused(bool _pause) public{
        require(msg.sender == owner, "You are not the owner!");
        paused = _pause;
    }

    function payEther() public payable {

    }

    function withdrawEther(address payable _to) public {
        require(owner == msg.sender, "You arent owner!!");
        require(!paused, "contract is paused");
        _to.transfer(address(this).balance);
    }
}