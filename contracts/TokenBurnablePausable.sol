// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract PinaCoin is ERC20, ERC20Burnable, Pausable, AccessControl {
    bytes32 public constant Owner = keccak256("Owner");

    constructor() ERC20("Pina Coin", "Pina") {
        _grantRole(Owner, msg.sender);
    }

    function pause() public onlyRole(Owner) {
        _pause();
    }

    function unpause() public onlyRole(Owner) {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}