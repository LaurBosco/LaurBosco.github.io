function mintFunction(uint256 amountToMint) public {
    uint256 currentSupply = totalSupply();

    // New: Require minimum minting amount of 10 tokens (adjusted for decimals)
    require(amountToMint >= 10 * (10 ** decimals()), 
        "You must mint at least 10 tokens.");

    // New: Require maximum minting amount of 100 tokens (adjusted for decimals)
    require(amountToMint <= 100 * (10 ** decimals()), 
        "You cannot mint more than 100 tokens at a time.");

    // Existing: Ensure max supply is not exceeded
    require(currentSupply + amountToMint <= maxTokenSupply, 
        "Minting the amount requested would exceed the max supply allowed.");

    _mint(msg.sender, amountToMint);
}
