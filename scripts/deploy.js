const hre = require("hardhat");

async function main() {
  const ChainHaven = await hre.ethers.getContractFactory("ChainHaven");
  const chainHaven = await ChainHaven.deploy();

  await chainHaven.waitForDeployment();
  console.log("✅ ChainHaven deployed to:", await chainHaven.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
