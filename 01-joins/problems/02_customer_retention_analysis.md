# Problem 2: Customer Retention Analysis

## Business Scenario

Your marketing team is planning a re-engagement campaign and needs to identify customer segments based on their purchasing behavior. They want to understand the full customer landscape - including those who signed up but never purchased, and those who haven't ordered recently.

## Requirements

Create a query that shows:

1. **All customers** (whether they've ordered or not)
2. **Purchase behavior**: 
   - Total number of orders (0 if none)
   - Total amount spent (0 if none) 
   - Days since their last order (NULL if never ordered)
3. **Customer segmentation**: Mark customers as "Active", "Inactive", or "Never Purchased"
   - Active: Ordered within last 30 days
   - Inactive: Last order was 31+ days ago  
   - Never Purchased: No orders at all
4. **Sorting**: Never Purchased first, then by days since last order (longest first)
