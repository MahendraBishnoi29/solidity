// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract FixedArrays {

       // declaring a fixed-size array of type uint with 3 elements
    uint[3] public array = [1, 2, 3];

  // changing an element of the array at a specific index
    function setArray(uint i, uint value) public {
        array[i] = value;
    }
    
     // returning the number of elements in the array
    function getArrayValue() public view returns(uint){
        return array.length;
    }
}