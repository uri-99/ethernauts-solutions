// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Buyer} from "../src/Buyer.sol";

contract Deploy is Script {
    Buyer public buyer;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        buyer = new Buyer(0x027DD63AF53B54d242b1748C2a181eeFeb3a2830);

        vm.stopBroadcast();
    }
}
