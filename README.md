# Simple On-Chain Marketplace

This repository contains a high-quality, flat-structured implementation of a decentralized commerce platform. It allows users to act as both buyers and sellers, facilitating trustless exchange of value for digital goods or services.

## Features
* **Item Listing:** Sellers can list items with a name, description, and price in Wei.
* **Escrow-like Logic:** The contract handles the transfer of funds from buyer to seller automatically upon purchase.
* **State Management:** Tracks which items are available, sold, or cancelled.
* **Event Logging:** Emits detailed logs for frontend tracking of new listings and successful sales.

## Getting Started
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Deploy `Marketplace.sol`.
3. Use `listItem` to put an item up for sale.
4. Another wallet can use `purchaseItem` by sending the exact amount of ETH required.
5. The seller automatically receives the funds.

## License
MIT
