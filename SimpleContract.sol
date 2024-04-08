//SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;
//pragma experimental ABIEncoderV2;
contract SimpleContract {

    uint public myValue = 50;
    string public myString = "Hello World!";

    function setValue (uint _myValue) public {
        myValue = _myValue;
    }

    function setString (string memory _myString) public {
        myString = _myString;
    }
}