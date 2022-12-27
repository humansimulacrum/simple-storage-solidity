// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;


// Before solididy v0.8.0 we could do the int overflow, in case of which number started from 0
// Now in that case transaction is automatically declined and reverted.

// But if we are sure that our math will never go out of bounds, we can use the unchecked clause
// It is more gas-efficient to use, but less safe

contract SafeMathTester {
    uint8 public bigNumber = 255;

    function add() public {
        unchecked {
           {bigNumber = bigNumber + 1;}  
        }
    }
}
