// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GatekeeperOne} from "../src/GatekeeperOne.sol";

contract Deploy is Script {
    GatekeeperOne public gateOne;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        gateOne = new GatekeeperOne();

        vm.stopBroadcast();
    }
}
