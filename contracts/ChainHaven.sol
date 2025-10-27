// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title ChainHaven
 * @dev A decentralized vault for secure asset deposits and withdrawals.
 */
contract ChainHaven {
    mapping(address => uint256) private balances;
    uint256 public totalDeposits;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    /**
     * @dev Deposit ether into the vault.
     */
    function deposit() external payable {
        require(msg.value > 0, "Deposit must be greater than zero");
        balances[msg.sender] += msg.value;
        totalDeposits += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @dev Withdraw a specified amount from the vault.
     * @param _amount The amount to withdraw.
     */
    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        totalDeposits -= _amount;
        payable(msg.sender).transfer(_amount);
        emit Withdrawn(msg.sender, _amount);
    }

    /**
     * @dev Get the vault balance of a specific user.
     * @param _user The user's address.
     * @return The balance of the user in wei.
     */
    function getBalance(address _user) external view returns (uint256) {
        return balances[_user];
    }
}
