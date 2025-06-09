// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {

    string private constant tokenName = "My lorax minting smart contract."; // Token name
    string private constant tokenSymbol = "LxC"; // Token symbol
    uint8 private constant tokenDecimals = 18; // Number of decimal places
    uint256 private constant maxTokenSupply = 8000000 * (10 ** uint256(tokenDecimals)); // Max token supply

    constructor() ERC20(tokenName, tokenSymbol) {
        // Constructor doesn't mint any tokens — minting is handled separately
    }

    function mintFunction(uint256 wholeTokensToMint) public {
        uint256 amountToMint = wholeTokensToMint * (10 ** decimals());
        uint256 currentSupply = totalSupply();

        // Enforce minimum mint of 10 tokens
        require(wholeTokensToMint >= 10, 
            "You must mint at least 10 tokens.");

        // Enforce maximum mint of 100 tokens per transaction
        require(wholeTokensToMint <= 100, 
            "You cannot mint more than 100 tokens at a time.");

        // Ensure minting doesn't exceed max supply
        require(currentSupply + amountToMint <= maxTokenSupply, 
            "Minting the amount requested would exceed the max supply allowed.");

        _mint(msg.sender, amountToMint);
    }
}
