# 🧾 TourRewards Smart Contracts

This repository contains the smart contracts for **TourRewards**, a Web3-based tourism gamification platform that rewards real-world exploration with soulbound NFTs and monthly incentives.

Tourists visiting key landmarks in San Juan and Mendoza collect **non-transferable NFTs** (ERC-1155), which serve as verifiable proof of visit. At the end of each month, a **reward pool**—funded by governments or sponsors—is automatically distributed to users based on their tourism engagement.

---

## 🛠 Contracts

### 🧩 `nfts.sol`

* ERC-1155 smart contract with **soulbound NFTs**
* Each token represents a unique tourist location
* Visitors can only claim each location once (`hasClaimed`)
* Supports per-token metadata via `setTokenURI(tokenId, uri)`

### 💰 `TourismRewardPool.sol`

* ERC-20 reward distribution smart contract
* Records visit counts via `registerVisit(address user)`
* Distributes reward tokens proportionally via `distributeRewards()`
* Includes a whitelist of approved merchants for token redemption

---

## 🔗 Deployed Network

Tested and deployed on **Moonbase Alpha** (Moonbeam Testnet)

* TourRewards contract: `0xYourContractAddressHere`
* TourismRewardPool contract: `0xYourContractAddressHere`

---

## 📁 Folder Structure

```
.
├── hackathon/
│   ├── nfts.sol
│   └── TourismRewardPool.sol
```

---

## 🚀 Frontend & Backend

These components provide:

* Web3Auth login (Google/email)
* NFT claiming via QR scan
* Monthly reward tracking
* Token redemption at local merchants

---

## 🧪 How to Use

1. Clone the repo
   `git clone `

2. Install dependencies
   Compile

3. Deploy to Moonbase Alpha using Remix or Hardhat

4. Link the deployed contract addresses to the frontend `.env` or config files

---

## 🧱 Tech Stack

* Solidity 0.8.20
* OpenZeppelin Contracts
* ERC-1155 (soulbound variant)
* ERC-20 with merchant whitelisting
* IPFS for metadata hosting
* Moonbeam’s Moonbase Alpha for deployment

---

## 📄 License

MIT — open for public, educational, and governmental reuse.

---

## 💡 Project Context

TourRewards was developed during a Web3 hackathon to explore how blockchain can incentivize real-world behavior and strengthen local economies. It demonstrates how smart contracts can support transparent tourism reward systems, verifiable visit tracking, and token-based local commerce.

The project is designed to be modular and replicable across different regions, providing an open-source infrastructure for tourism-driven economic development.

Feel free to fork, extend, or propose enhancements!
