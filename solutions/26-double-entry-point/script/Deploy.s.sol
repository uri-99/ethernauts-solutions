// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DetectionBot} from "../src/DetectionBot.sol";

contract Deploy is Script {
    DetectionBot public detectionBot;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        detectionBot = new DetectionBot();

        vm.stopBroadcast();
    }
}
