// SPDX-License-Identifier: MIT

// ^0.8.7 - newer or this version
// >=0.8.7 < 0.9.0 could be specified by range
pragma solidity ^0.8.8;

contract SimpleStorage {
    // Default init is null;
    // Default visibility is internal (protected in other languages)
    // Transaction cost depends on number of operations
    // Variables are function-scoped.

    // View and pure function doesn't require any gas
    // View allows to fetch something from blockchain
    // Pure additionally prohibits reading, for example
    // function add () public pure returns (uint256) {
    //     return (1+1);
    // }
    // Also read/pure operations do not have a transaction hash, because the are not are transactions
    // But if those operations are performed inside of the smart contract it would cost gas.

    // Basically gas in only spent if we try to modify the blockchain state

    // Data types: boolean, uint, int, string, address, bytes
    // Max bytes size is 32.

    // could be uint/int with 8 step, default is 256
    uint256 favoriteNumber;


    // To create the instance of struct we need to pass something like JS object in the constructor
    // and without new keyword
    struct People {
        uint256 favoriteNumber;
        // String are automatically converted into bytes, but string are only for the text
        string name;
    }

    // Public property visibility creates the view function by itself

    // Arrays could be fixed length:
    // People[3] public people
    // Or dynamic length:
    // People[] public people;

    // People[] public people = []; is not valid
    People[] public people;

    // Like dictionary/map in JS
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // We should implicitly pass the memory/storage/calldata only for arrays/structs/mappings (Solidity "special" types)
    // String is secretly an array of bytes (like char* in C), so it fails into this category

    // Calldata - temporary (during transaction), can't be modified
    // Memory - temporary (during transaction), can be modified
    // Storage - permanent, can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Another way to create that entity
        // people.push(People({name: _name, favouriteNumber: _favouriteNumber}));
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
