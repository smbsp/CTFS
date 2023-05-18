const ethers = require("ethers");
(async () => {
  // https://ropsten.etherscan.io/address/0x92b28647ae1f3264661f72fb2eb9625a89d88a31
  // https://ropsten.etherscan.io/getRawTx?tx=0xabc467bedd1d17462fcc7942d0af7874d6f8bdefee2b299c9168a216d3ff0edb
  const tx = ethers.utils.parseTransaction(
    "0xf87080843b9aca0083015f90946b477781b0e68031109f21887e6b5afeaaeb002b808c5468616e6b732c206d616e2129a0a5522718c0f95dde27f0827f55de836342ceda594d20458523dd71a539d52ad7a05710e64311d481764b5ae8ca691b05d14054782c7d489f3511a7abf2f5078962"
  );
  // console.log(tx.r);
  // console.log(tx.s);
  // console.log(tx.v);
  // code to recover the public key from https://ethereum.stackexchange.com/questions/78815/ethers-js-recover-public-key-from-contract-deployment-via-v-r-s-values
  const expandedSig = {
    r: tx.r,
    s: tx.s,
    v: tx.v,
  };
  const signature = ethers.utils.joinSignature(expandedSig);
  const txData = {
    gasPrice: tx.gasPrice,
    gasLimit: tx.gasLimit,
    value: tx.value,
    nonce: tx.nonce,
    data: tx.data,
    chainId: tx.chainId,
    to: tx.to, // you might need to include this if it's a regular txand not simply a contract deployment
  };
  // console.log(tx.gasPrice);
  // console.log(tx.gasLimit);
  // console.log(tx.value);
  // console.log(tx.nonce);
  // console.log(tx.data);
  // console.log(tx.chainId);
  // console.log(tx.to);
  const rsTx = await ethers.utils.resolveProperties(txData);
  console.log("rsTx", rsTx);
  const raw = ethers.utils.serializeTransaction(rsTx); // returns RLPencoded tx
  console.log("raw", raw);
  const msgHash = ethers.utils.keccak256(raw); // as specified byECDSA
  console.log("msgHash", msgHash);
  const msgBytes = ethers.utils.arrayify(msgHash); // create binaryhash
  console.log("msgBytes", msgBytes);
  const recoveredPubKey = ethers.utils.recoverPublicKey(msgBytes, signature);
  console.log("recoveredPubKey", recoveredPubKey);
  // recoveredPubKey is uncompressed, so starts with 0x04
  const compressedPubKey = ethers.utils.arrayify(recoveredPubKey).slice(1);
  console.log("compressedPubKey", compressedPubKey);
  // console.log(compressedPubKey)

  const answerPubKeyHex = Buffer.from(compressedPubKey).toString("hex");
  console.log(`0x${answerPubKeyHex}`);
})();
// 0x613a8d23bd34f7e568ef4eb1f68058e77620e40079e88f705dfb258d7a06a1a0364dbe56cab53faf26137bec044efd0b07eec8703ba4a31c588d9d94c35c8db4;
