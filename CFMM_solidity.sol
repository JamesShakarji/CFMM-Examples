pragma solidity ^0.6.0;

// Import the SafeMath library for safe integer arithmetic
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contract/math/SafeMath.sol";

// Use the SafeMath library for all integer operations
using SafeMath for uint;

// Define the ConstantFunctionMarketMaker contract
contract ConstantFunctionMarketMaker {
    // The list of orders
    uint[][2] public orders;
    
    // The total profit
    uint public totalProfit;
    
    // Constructor function to initialize the contract
    constructor(uint[][2] memory _orders) public {
        // Set the orders
        orders = _orders;
        // Initialize the total profit to zero
        totalProfit = 0;
    }
    
    // Function to calculate the total profit
    function calculateTotalProfit() public view returns (uint) {
        // Initialize variables for the best bid and ask prices
        uint bestBid = 0;
        uint bestAsk = uint(-1);
        // Initialize the total profit to zero
        uint profit = 0;
        
        // Loop through the orders
        for (uint i = 0; i < orders.length; i++) {
            // If the order is a bid (size > 0)
            if (orders[i][1] > 0) {
                // Update the best bid price if necessary
                bestBid = max(bestBid, orders[i][0]);
            }
            // If the order is an ask (size < 0)
            else {
                // Update the best ask price if necessary
                bestAsk = min(bestAsk, orders[i][0]);
            }
            // Calculate the profit from the order
            profit += orders[i][1] * (orders[i][0] - (bestBid + bestAsk) / 2);
        }
        
        // Return the total profit
        return profit;
    }
}

// Example usage
ConstantFunctionMarketMaker cfmm = new ConstantFunctionMarketMaker([[100, 10], [105, 5], [95, -10], [90, -5]]);
uint totalProfit = cfmm.calculateTotalProfit();
