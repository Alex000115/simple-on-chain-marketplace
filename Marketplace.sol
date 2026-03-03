// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Marketplace
 * @dev A simple decentralized marketplace for listing and buying items.
 */
contract Marketplace {
    uint256 public itemCount = 0;

    struct Item {
        uint256 id;
        string name;
        uint256 price;
        address payable seller;
        bool isSold;
    }

    mapping(uint256 => Item) public items;

    event ItemListed(uint256 id, string name, uint256 price, address seller);
    event ItemSold(uint256 id, address buyer, uint256 price);

    /**
     * @dev List a new item in the marketplace.
     */
    function listItem(string memory _name, uint256 _price) public {
        require(_price > 0, "Price must be at least 1 wei");
        
        itemCount++;
        items[itemCount] = Item(itemCount, _name, _price, payable(msg.sender), false);
        
        emit ItemListed(itemCount, _name, _price, msg.sender);
    }

    /**
     * @dev Purchase an item. Funds are transferred to the seller immediately.
     */
    function purchaseItem(uint256 _id) public payable {
        Item storage item = items[_id];
        
        require(_id > 0 && _id <= itemCount, "Item does not exist");
        require(msg.value >= item.price, "Not enough ETH sent");
        require(!item.isSold, "Item already sold");
        require(msg.sender != item.seller, "Seller cannot buy their own item");

        item.isSold = true;
        item.seller.transfer(msg.value);
        
        emit ItemSold(_id, msg.sender, item.price);
    }
}
