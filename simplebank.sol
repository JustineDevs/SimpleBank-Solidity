// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract SimpleBank {
    mapping(address => uint256) private balances;
    mapping(address => bool) private isRegistered;

    event Deposit(address indexed account, uint256 amount);
    event Withdraw(address indexed account, uint256 amount);

    modifier onlyRegistered() {
        require(isRegistered[msg.sender], "Not registered");
        _;
    }

    function register() public {
        require(!isRegistered[msg.sender], "Already registered");
        isRegistered[msg.sender] = true;
    }

    function deposit() public payable onlyRegistered {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
}
// DYASTIN // 