// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GateOne} from "../src/GateOne.sol";

contract Deploy is Script {
    GateOne public gateOne;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        gateOne = new GateOne();

        vm.stopBroadcast();
    }
}
