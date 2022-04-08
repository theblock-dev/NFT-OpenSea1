const {ethers} = require("hardhat");

async function main() {
  const SuperMario = await ethers.getContractFactory("SuperMario");
  const superInstance = await SuperMario.deploy("SuperMarioCollection", "SMC");
  await superInstance.deployed();
  console.log("contract was deployed to:", superInstance.address);

  await superInstance.mint("https://ipfs.io/ipfs/Qmajo29bjJ1gRqVi5as79qhKK7EiCTMjWnuphPxPTrtjKp");
  console.log("NFT successfully minted");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
