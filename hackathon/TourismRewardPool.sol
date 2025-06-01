// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TourismRewardPool is Ownable {
    IERC20 public tourismToken;
    uint256 public lastDistribution;
    uint256 public totalVisits;

    mapping(address => uint256) public monthlyVisits;
    mapping(address => bool) public isRegisteredUser;
    address[] public participants;

    event VisitRegistered(address indexed user, uint256 totalUserVisits);
    event PoolFunded(address indexed funder, uint256 amount);
    event RewardsDistributed(uint256 totalDistributed);

    constructor(address _tourismToken, address initialOwner) Ownable(initialOwner) {
    tourismToken = IERC20(_tourismToken);
    lastDistribution = block.timestamp;
    }


    function registerVisit(address user) external onlyOwner {
        if (!isRegisteredUser[user]) {
            isRegisteredUser[user] = true;
            participants.push(user);
        }
        monthlyVisits[user]++;
        totalVisits++;

        emit VisitRegistered(user, monthlyVisits[user]);
    }

    function fundPool(uint256 amount) external {
        require(amount > 0, "Amount must be > 0");
        tourismToken.transferFrom(msg.sender, address(this), amount);
        emit PoolFunded(msg.sender, amount);
    }

    function distributeRewards() external onlyOwner {
        require(block.timestamp >= lastDistribution + 30 days, "Debes esperar al fin de mes");
        require(totalVisits > 0, "No hay visitas registradas");

        uint256 totalBalance = tourismToken.balanceOf(address(this));

        for (uint256 i = 0; i < participants.length; i++) {
            address user = participants[i];
            uint256 visits = monthlyVisits[user];

            if (visits > 0) {
                uint256 reward = (visits * totalBalance) / totalVisits;
                if (reward > 0) {
                    tourismToken.transfer(user, reward);
                }
            }

            monthlyVisits[user] = 0;
        }

        totalVisits = 0;
        lastDistribution = block.timestamp;
        delete participants;

        emit RewardsDistributed(totalBalance);
    }

    function getParticipants() external view returns (address[] memory) {
        return participants;
    }
}