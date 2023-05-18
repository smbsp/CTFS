const { ethers } = require("ethers");
const bruteForceHash = (range, targetHash) => {
  for (let i = 0; i < range; i++) {
    const hash = ethers.utils.keccak256([i]);
    if (targetHash.includes(hash)) {
      console.log(i);
    }
  }
};

const number = bruteForceHash(
  2 ** 8,
  `0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365`
);
