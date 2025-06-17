// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGateThree {
    function enter(bytes8) external returns (bool);
}

contract GateThreeKey {
    error GateThreeEnterFailed(bytes8 key);
    error InvalidKey(bytes8 key);

    constructor(address _gateThreeContract) {
        IGateThree gateThreeContract = IGateThree(_gateThreeContract);

        uint64 key1 = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
        uint64 key2 = key1 ^ type(uint64).max;

        bytes8 key = bytes8(key2);

        if (uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(key) != type(uint64).max) {
            revert InvalidKey(key);
        }

        if (!gateThreeContract.enter(key)) {
            revert GateThreeEnterFailed(key);
        }
    }
}
