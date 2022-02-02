// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Control is AccessControl{

    uint256 number;

    bytes32 public constant ROL_ADMIN = keccak256("ROL_ADMIN");
    bytes32 public constant ROL_WRITER = keccak256("ROL_WRITER");

    constructor() {
        _grantRole(ROL_ADMIN, msg.sender);
    }

    modifier onlyAdmin {
        require(hasRole(ROL_ADMIN, msg.sender),"This function can only be use by the Admin ");
        _;
    }

    modifier onlyWriter {
        require(hasRole(ROL_WRITER,msg.sender),"This function can only be use by the Writer");
        _;  
    }  

    function addRole(bytes32 role, address account) public onlyAdmin {
        _grantRole(role,account);
    }

    function deleteRole(bytes32 role, address account) public onlyAdmin {
        _revokeRole(role,account);
    }

    function store(uint256 num) public onlyWriter {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }
}