const Web3 = require("web3");
const web3 = new Web3(
  "https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5" // Infura API
);

async function main() {
  const begin = Math.floor(Date.now() / 1000);

  const creationCode =
    "0x" + require("./ExploitFuzzyIdentityChallenge.json").data.bytecode.object;
  const factoryAddress = "0xeC50503Ed61d2A8E71Fb71bcDeaa2788F77bDE4D";

  const prefix = "0xff" + factoryAddress.slice(2);
  const suffix = web3.utils.sha3(creationCode).slice(2);

  var salt = 0;
  while (true) {
    const saltHex = salt.toString(16).padStart(64, "0");
    const concatString = prefix.concat(saltHex).concat(suffix);

    const hashed = web3.utils.sha3(concatString);

    // console.log(`salt: ${salt}, hashed: ${hashed}`);

    if (hashed.substr(26).includes("badc0de")) {
      console.log(`salt: ${salt}, hashed: ${hashed}`);
      break;
    }

    salt++;
  }

  const end = Math.floor(Date.now() / 1000);
  console.log(`begin: ${begin}`);
  console.log(`end: ${end} `);
  console.log(`pass: ${end - begin}`);
}

main();
