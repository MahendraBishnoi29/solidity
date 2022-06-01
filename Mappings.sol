// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Mapping{
 
    mapping(uint => string) public roll_no;

    function setter(uint key, string memory value) public {
            roll_no[key] = value;
    }
}