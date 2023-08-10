# Zomato-case study

This project revolves around a database inspired by Zomato, a popular food delivery platform. The database is designed with different tables to capture essential aspects of the ecosystem, providing insights into user behavior, restaurant operations, and order dynamics.

# Tables:

Users: Contains user information such as user ID, name, email, and password.
Food: Stores food-related details like f_ID, f_name, and type.
Restaurants: Holds data about restaurants, including r_ID, r_name and cuisine.
Orders: Captures order details like order_ID, user_ID, r_ID,amount,date,partner_id,delivery_time,delivery_rating and restaurant_rating.
Order_Details: Records information about individual items within order_id,id and f_id.
Menu: Stores the menu items available in restaurants, including menu memu_id, f_id,r_id and price.
Delivery_Partners: Contains details about delivery partners like partner_id and partner_name.

# Objectives:

1. Identifying Customers with No Orders: Write SQL queries to find customers who have never placed any orders.
2. Calculating the Average Price per Dish: Calculate the average price per dish across all menu items.
3. Top Restaurant by Monthly Orders: Determine the top restaurant in terms of the number of orders for a given month.
4. Restaurants with High Monthly Sales: Identify restaurants with monthly sales exceeding a specified threshold.
5. Customer Order Details: Retrieve all order details for a specific customer within a particular date range.
6. Popular Restaurants with Repeated Customers: Find restaurants with the highest count of repeated customers.
7. Swiggy's Monthly Revenue Growth: Analyze month-over-month revenue growth for the Swiggy platform.
8. Customer's Favorite Food: Discover the most frequently ordered food items for each customer.
9. Loyal Customers across Restaurants: Identify customers who have placed orders at all restaurants.
    
This project aims to provide practical insights into the database using SQL queries, addressing various aspects of the Zomato ecosystem. By exploring and querying the data, it offers valuable information about user preferences, restaurant performance, and overall business growth.

