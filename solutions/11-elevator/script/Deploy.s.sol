// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Building} from "../src/Building.sol";

contract Deploy is Script {
    Building public building;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        building = new Building(0xe6881f5B2cdEdf13FBaD5ff1245e88a4f9038E7b);

        vm.stopBroadcast();
    }
}
