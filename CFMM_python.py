from typing import List, Tuple

def constant_function_market_maker(orders: List[Tuple[int, int]]) -> int:
    # Initialize variables for the best bid and ask prices
    best_bid = 0
    best_ask = float('inf')
    # Initialize the total profit to zero
    total_profit = 0
    
    # Loop through the orders
    for price, size in orders:
        # If the order is a bid (size > 0)
        if size > 0:
            # Update the best bid price if necessary
            best_bid = max(best_bid, price)
        # If the order is an ask (size < 0)
        else:
            # Update the best ask price if necessary
            best_ask = min(best_ask, price)
        # Calculate the profit from the order
        profit = size * (price - (best_bid + best_ask) // 2)
        # Add the profit to the total profit
        total_profit += profit
        
    # Return the total profit
    return total_profit

# Example usage
orders = [(100, 10), (105, 5), (95, -10), (90, -5)]
profit = constant_function_market_maker(orders)
print(f'Total profit: {profit}')
