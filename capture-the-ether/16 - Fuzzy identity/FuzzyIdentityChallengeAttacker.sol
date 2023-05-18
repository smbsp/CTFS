// 1 - Deploy contract ExploiterFactory - 0xeC50503Ed61d2A8E71Fb71bcDeaa2788F77bDE4D
// 2 - Modify the factory address in findSalt.js and run `node findSalt.js`
// salt: 1290295, hashed: 0xc6550cd69fcb369cf72dec9f11fbadc0dee85a324c95f34ac45f73f2249c3196
// begin: 1660557321
// end: 1660557326
// pass: 5
// 3 - Use the generate salt from the script to run createInstance function of ExploiterFactory and
// check the target address - 0x11fbAdC0dee85a324c95F34AC45f73f2249c3196
// 4 - Use the instance of ExploitFuzzyIdentityChallenge at target address and call attack

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFuzzyIdentityChallenge {
    function authenticate() external;
}

contract ExploitFuzzyIdentityChallenge {
    function name() public pure returns (bytes32) {
        return bytes32("smarx");
    }

    function attack(address target) public {
        IFuzzyIdentityChallenge(target).authenticate();
    }
}

contract ExploiterFactory {
    ExploitFuzzyIdentityChallenge public target;

    function createInstance(uint256 salt) public {
        bytes memory initCode = abi.encodePacked(
            type(ExploitFuzzyIdentityChallenge).creationCode
        );

        assembly {
            let result := create2(
                0x0,
                add(0x20, initCode),
                mload(initCode),
                salt
            )
            sstore(target.slot, result)
        }
    }
}
