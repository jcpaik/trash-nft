// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Trash.sol";

contract TrashScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        string memory baseURI = vm.envString("BASE_URI");

        vm.startBroadcast(deployerPrivateKey);

        Trash trash = new Trash("Trash", "TRSH", baseURI);

        vm.stopBroadcast();
    }
}
