// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Claimer} from "../src/Claimer.sol";

contract ClaimerScript is Script {
    Claimer public claimer;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        claimer = new Claimer(0xee2D4aCe63cbfb3660066946493493560cD04401);

        vm.stopBroadcast();
    }
}
