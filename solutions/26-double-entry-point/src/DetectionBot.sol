
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external; //won't use, called by EOA for setup
    function notify(address user, bytes calldata msgData) external; //won't use, called by DoubleEntryPoint to call this Bot
    function raiseAlert(address user) external;                     //use if tx should be stopped.
}

contract DetectionBot is IDetectionBot {

    constructor() {
    }

    // should call raiseAlert() if something is off.
    function handleTransaction(address user, bytes calldata msgData) public {
        IForta forta = IForta(msg.sender);

        if (isDangerous(msgData)) {
            forta.raiseAlert(user);
        }
    }

    function isDangerous(bytes calldata msgData) public view returns (bool) {
        return true;
    }
}

