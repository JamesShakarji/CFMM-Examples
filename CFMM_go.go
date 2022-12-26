package main

import "fmt"

func constantFunctionMarketMaker(orders [][2]int) int {
	// Initialize variables for the best bid and ask prices
	bestBid := 0
	bestAsk := 1<<31 - 1
	// Initialize the total profit to zero
	totalProfit := 0

	// Loop through the orders
	for _, order := range orders {
		// If the order is a bid (size > 0)
		if order[1] > 0 {
			// Update the best bid price if necessary
			if order[0] > bestBid {
				bestBid = order[0]
			}
		}
		// If the order is an ask (size < 0)
		if order[1] < 0 {
			// Update the best ask price if necessary
			if order[0] < bestAsk {
				bestAsk = order[0]
			}
		}
		// Calculate the profit from the order
		profit := order[1] * (order[0] - (bestBid + bestAsk) / 2)
		// Add the profit to the total profit
		totalProfit += profit
	}

	// Return the total profit
	return totalProfit
}

func main() {
	// Example usage
	orders := [][2]int{{100, 10}, {105, 5}, {95, -10}, {90, -5}}
	profit := constantFunctionMarketMaker(orders)
	
