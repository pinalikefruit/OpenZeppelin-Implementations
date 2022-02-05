//SPDX-License-Identifier:  MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Desafio is Ownable {
    mapping(address => uint) balances;


    function min(uint amount) public onlyOwner {
        balances[msg.sender] += amount;
    }

    function depositar() public payable{
        balances[msg.sender] += msg.value;
    }

    function retirar() public  {
        require(balances[msg.sender] > 0);
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool result, ) = msg.sender.call{value:amount,gas:600000}("");
        if(!result) revert();
    }
}