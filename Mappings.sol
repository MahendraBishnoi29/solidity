// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.9.0;

contract Mapping{
 
//    mapping(uint => string) public myCity;

//     function setHouse(uint _hs, string memory _hn) public{
//          myCity[_hs] = _hn;
//     }
// another example
            
            mapping(address => mapping(uint => bool)) public nestedMap;

            function setMap(address _addr, uint _i, bool _bool) public{
                   nestedMap[_addr][_i] = _bool;
            }

}