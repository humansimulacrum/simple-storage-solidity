// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

// Inheritance is realised by is keyword
// Override should be written explicitly

contract ExtraStorage is SimpleStorage {
    function store (uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}