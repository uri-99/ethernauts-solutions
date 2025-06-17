// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {ForceEther} from "../src/ForceEther.sol";

contract DeployScript is Script {
    ForceEther public forceEther;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        forceEther = new ForceEther();

        vm.stopBroadcast();
    }
}
