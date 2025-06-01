// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TourismSouvenirs is ERC1155, Ownable {
    mapping(address => mapping(uint256 => bool)) public hasClaimed;
    mapping(uint256 => string) private _tokenURIs;
    address public constant backendAddress = 0xE0d86D63904DDd3eE4C9dA631693b31491e59DF0;

    constructor() ERC1155("") Ownable(msg.sender) {}

    function claim(uint256 tokenId, address recipient) external {
        // require(msg.sender == backendAddress);
        require(!hasClaimed[msg.sender][tokenId], "Ya reclamado");
        hasClaimed[msg.sender][tokenId] = true;
        _mint(recipient, tokenId, 1, "");
    }

    function setTokenURI(uint256 tokenId, string memory newuri) external onlyOwner {
        _tokenURIs[tokenId] = newuri;
    }

    function uri(uint256 tokenId) public view override returns (string memory) {
        return _tokenURIs[tokenId];
    }
} 
