//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";

contract Verification {
    using ERC165Checker for address;

    bytes4 private InterfaceId_ERC721 = 0x80ac58cd;
    bytes4 private InterfaceId_ERC20 = 0x36372b07;

    function tryERC721(
        address token
    )
        public view returns(bool)
    {
        return token.supportsInterface(InterfaceId_ERC721);
        
    }

    function tryERC20(
        address token
    )
        public view returns(bool)
    {
        return token.supportsInterface(InterfaceId_ERC20);
        
    }
}