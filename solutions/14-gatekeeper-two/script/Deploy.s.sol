// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {GateThreeKey} from "../src/GateThreeKey.sol";

contract Deploy is Script {

    GateThreeKey public gateThreeKey;

    function setUp() public {}

    error InvalidKey2(bytes8 key);

    function run() public {
        vm.startBroadcast();

        uint64 key1 = uint64(bytes8(keccak256(abi.encodePacked(msg.sender))));
        uint64 key2 = key1 ^ type(uint64).max;

        bytes8 key = bytes8(key2);

        if (uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(key) != type(uint64).max) {
            console.log("Invalid key");
        } else {
            console.log("Valid key");
        }
        
        try new GateThreeKey(0xFc73D380Ff6374343c108D6AE890bAdD3aD81C4E) returns (GateThreeKey gateThreeKey) {
            console.log("Successfully deployed GateThreeKey at:", address(gateThreeKey));
        } catch Error(string memory reason) {
            console.log("Failed with reason:", reason);
        } catch (bytes memory lowLevelData) {
            console.logBytes(lowLevelData);
        }

        vm.stopBroadcast();
    }
}
