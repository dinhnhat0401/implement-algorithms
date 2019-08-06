// First, I wanna know how much money I could have made yesterday if I'd been trading Apple stocks all day.
// [So I grabbed Apple's stock prices from yesterday and put them in a list called stock_prices, where:

// The indices are the time (in minutes) past trade opening time, which was 9:30am local time.
// The values are the price (in US dollars) of one share of Apple stock at that time.
// So if the stock cost $500 at 10:30am, that means stock_prices[60] = 500.

// Write an efficient function that takes stock_prices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.

// For example:

//   stock_prices = [10, 7, 5, 8, 11, 9]

// get_max_profit(stock_prices)
// # Returns 6 (buying for $5 and selling for $11)


import java.util.*;

public class TradingStock {
    public static void main(String[] args) throws Exception {
        // Your code here!
        int[] arr = {10, 7, 5, 8, 11, 9};
        System.out.println(getMaxProfit(arr, 6));
        System.out.println(getMaxProfitV2(arr, 6));
    }
    
    static int getMaxProfit(int[] stockPrices, int count) {
      int [] max = new int[count];
      max[count - 1] = 0;
      for (int i = count - 2; i >= 0; i--) {
          max[i] = max[i + 1] > stockPrices[i] ? max[i+ 1] : stockPrices[i];
      }
    
      int result = 0;
      for (int i = 0; i < count; i++) {
        int tmp = max[i] - stockPrices[i];
        result = result > tmp ? result : tmp;
      }
    
      return result;
    }
    
    static int getMaxProfitV2(int[] stockPrices, int count) {
      int max = 0;
      int result = 0;
      for (int i = count - 2; i >= 0; i--) {
        max = max > stockPrices[i] ? max : stockPrices[i];
        int profit = max - stockPrices[i];
        result = result > profit ? result : profit;
      }

      return result;
    }
}

