// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract SimpleBank {
    // Mapping to store user balances
    mapping(address => uint) private balances;

    // Function to set the balance for the sender
    function setBalance(uint amount) public {
        balances[msg.sender] = amount;
    }

    // Function to get the balance of the sender
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Function to increase the balance of the sender
    function increaseBalance(uint amount) public {
        balances[msg.sender] += amount;
    }

    // Function to decrease the balance of the sender
    function decreaseBalance(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
    }
}

// DYASTIN // 