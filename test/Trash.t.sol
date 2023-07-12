// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Trash.sol";

contract TrashTest is Test {
    Trash public trash;

    function setUp() public {
        trash = new Trash("Trash", "TRSH", "https://google.com");
    }
}
