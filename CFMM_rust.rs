use std::cmp::{max, min};

fn constant_function_market_maker(orders: Vec<(i32, i32)>) -> i32 {
    // Initialize variables for the best bid and ask prices
    let mut best_bid = 0;
    let mut best_ask = std::i32::MAX;
    // Initialize the total profit to zero
    let mut total_profit = 0;
    
    // Loop through the orders
    for (price, size) in orders {
        // If the order is a bid (size > 0)
        if size > 0 {
            // Update the best bid price if necessary
            best_bid = max(best_bid, price);
        }
        // If the order is an ask (size < 0)
        else {
            // Update the best ask price if necessary
            best_ask = min(best_ask, price);
        }
        // Calculate the profit from the order
        let profit = size * (price - (best_bid + best_ask) / 2);
        // Add the profit to the total profit
        total_profit += profit;
    }
        
    // Return the total profit
    total_profit
}

// Example usage
let orders = vec![(100, 10), (105, 5), (95, -10), (90, -5)];
let profit = constant_function_market_maker(orders);
println!("Total profit: {}", profit);
